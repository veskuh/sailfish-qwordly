import QtQuick 2.0
import Sailfish.Silica 1.0
import "words.js" as Words

Page {
    id: page

    allowedOrientations: Orientation.Portrait
    anchors.fill: parent

    Item {
        id: gameArea
        focus: true
        anchors.fill:parent
        Label {
            id: title
            text: "QWordly"
        }
        IconButton {
            id: about
            anchors.top: parent.top
            anchors.right: parent.right
            icon.source: "image://theme/icon-m-about?" + (pressed
                                                          ? Theme.highlightColor
                                                          : Theme.primaryColor)
            onClicked: {
                window.pageStack.push(Qt.resolvedUrl("About.qml"))
            }
        }

        Grid {
            anchors.top: about.bottom
            spacing: Theme.paddingMedium
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 5

            Repeater {
                id: cells
                property int currentIndex: 0
                property bool newRow: true
                property string correct: "kissa"
                property int activeRow: 0

                model: 30
                Rectangle {
                    id: cell
                    property string labelText: ""

                    width: Theme.itemSizeMedium
                    height: width
                    color: "black"
                    opacity: (Math.floor(index / 5) <= cells.activeRow) ? 0.8 : 0.2
                    Behavior on color { PropertyAnimation { duration:500 } }
                    Text {
                        anchors.centerIn: parent
                        text: cell.labelText
                        color: Theme.highlightColor
                        font.pixelSize: Theme.fontSizeLarge
                    }

                    Rectangle {
                        visible: index === cells.currentIndex && (cells.newRow || ((cells.currentIndex) % 5) != 0)
                        color: Theme.highlightColor
                        height:3
                        width: 50
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: Theme.paddingSmall
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Behavior on opacity { FadeAnimation{} }
                }

                function clear() {
                    for (var i = 0; i < 30; i++) {
                        itemAt(i).labelText = ""
                        itemAt(i).color = "black"
                        currentIndex = 0
                        newRow = true
                        window.setCoverColor(i, "black")
                    }
                }

                function addChar(guess) {
                    if (!newRow && ((currentIndex) % 5) == 0)
                        return

                    itemAt(currentIndex).labelText = guess
                    currentIndex++
                    newRow = false
                }

                function removeChar() {
                    if (currentIndex % 5 > 0) {
                        itemAt(currentIndex - 1).labelText = ""
                        currentIndex--;
                    }  else if (currentIndex > 0 && !newRow ) {
                        itemAt(currentIndex - 1).labelText = ""
                        currentIndex--;
                    }

                    if (currentIndex % 5 == 0) {
                        newRow = true
                    }
                }

                function tryAccept() {
                    var letterCount = {}
                    for (var i=0; i<5; i++) {
                        var letter = cells.correct[i]
                        if (!letterCount[letter])
                            letterCount[letter] = 1
                        else {
                            letterCount[letter] = letterCount[letter] + 1
                        }
                    }

                    for (var i=0; i<5; i++) {
                        console.log("letter:" + cells.correct[i] + letterCount[cells.correct[i]])
                    }

                    if (((currentIndex) % 5) == 0) {
                        newRow = true
                        if (currentIndex > 0) {
                            var correctCount = 0
                            for (var i=1; i<6; i++) {
                                var compareItem = itemAt(currentIndex - i)
                                var compareLetter = compareItem.labelText[0]
                                if (cells.correct[5-i]===compareLetter) {
                                    compareItem.color = "green"
                                    window.setCoverColor(currentIndex - i, "green")
                                    correctCount++
                                    keyMap.setColor("green",cells.correct[5-i])
                                    letterCount[compareLetter] = letterCount[compareLetter] - 1
                                }
                            }

                            for (var i=1; i<6; i++) {
                                var compareItem = itemAt(currentIndex - i)
                                var compareLetter = compareItem.labelText[0]

                                if (cells.correct.indexOf(compareLetter) > -1 ) {
                                    if (letterCount[compareLetter] > 0 && cells.correct[5-i]!==compareLetter) {
                                        letterCount[compareLetter] = letterCount[compareLetter] - 1
                                        compareItem.color = "orange"
                                        window.setCoverColor(currentIndex - i, "orange")
                                        keyMap.setColor("orange",compareItem.labelText[0])
                                    }
                                } else  {
                                    keyMap.setColor("red",compareItem.labelText[0])
                                }
                            }
                        }
                    }
                    if (correctCount==5) {
                        message.text= "CONGRATS!"
                        newGame.visible = true
                    }
                    else if (currentIndex == 30) {
                        message.text = "Answer is " + cells.correct
                        newGame.visible = true
                    }

                    cells.activeRow++
                }

                Component.onCompleted: {
                    correct = Words.newWord()
                }
            }
        }

        Column {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Theme.paddingLarge
            spacing: Theme.paddingLarge

            Text {
                id: message
                anchors.horizontalCenter: parent.horizontalCenter
                text: ""
                font.pixelSize: Theme.fontSizeExtraLarge
                opacity:0
                color: Theme.highlightColor

                onTextChanged: {
                    if (message.text !== "")
                        opacity = 1.0
                    else
                        opacity = 0.0
                }
                Behavior on opacity { PropertyAnimation {duration:500 } }
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                id: newGame
                text: "Play again!"
                visible: false
                onClicked: {
                    visible = false
                    cells.clear()
                    message.text = ""
                    keyMap.clear()
                    cells.correct = Words.newWord()
                    cells.activeRow = 0
                }
            }

            Grid {
                id: keyMap
                property string keys:"abcdefghijklmnopqrstuyvwzåäö"
                anchors.horizontalCenter: parent.horizontalCenter
                columns: Math.ceil(keys.length/4.0)
                spacing: Theme.paddingSmall

                Repeater {
                    id: keyRepeater
                    model: keyMap.keys.length
                    Rectangle {
                        property string text: keyMap.keys[index].toUpperCase()
                        radius: 5
                        Text {
                            text: parent.text
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: Theme.fontSizeMedium
                            anchors.centerIn: parent
                            color: Theme.primaryColor

                        }
                        opacity: 0.9
                        color: Theme.secondaryColor
                        width: Theme.itemSizeSmall
                        height: Theme.itemSizeSmall
                        property color oldColor : Theme.secondaryColor
                        Behavior on color { PropertyAnimation {duration:100 } }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                cells.addChar(text)
                            }
                            onPressed: {
                                oldColor = color
                                color = Theme.secondaryHighlightColor
                            }
                            onReleased: {
                                color = oldColor
                            }
                        }
                    }
                }
                function setColor(color, key) {
                    var keyLowerCase = key.toLowerCase()
                    var keyItem = keyRepeater.itemAt(keyMap.keys.indexOf(keyLowerCase))
                    if (keyItem.color != "green")
                        keyItem.color = color
                }

                function clear() {
                    for (var i=0; i < keyMap.keys.length; i++) {
                        keyRepeater.itemAt(i).color = "grey"
                    }
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter

                IconButton {
                    enabled: message.text === "" && !cells.newRow
                    icon.source: "image://theme/icon-m-backspace?" + (pressed
                                                                      ? Theme.highlightColor
                                                                      : Theme.primaryColor)
                    onClicked: {
                        cells.removeChar()
                    }
                }

                IconButton {
                    enabled: message.text === "" && !cells.newRow && cells.currentIndex % 5 == 0
                    icon.source: "image://theme/icon-m-enter?" + (pressed
                                                                  ? Theme.highlightColor
                                                                  : Theme.primaryColor)
                    onClicked: {
                        cells.tryAccept()
                    }
                }
            }
        }

        function allowedKey(str) {
            var letter = "" + str
            var lowerCase = letter.toLowerCase()
            const allowedKeys = Array.from(keyMap.keys)
            return allowedKeys.includes(lowerCase)
        }

        Keys.onReleased: {
            if (event.key === Qt.Key_Backspace) {
                cells.removeChar()
                return
            }

            if  (event.text!==""){
                console.log(event.text)
                if (allowedKey(event.text))
                    cells.addChar(event.text.toUpperCase())
            }
        }

        Keys.onReturnPressed: {
            console.log("Return")
            cells.tryAccept()
        }
    }
}
