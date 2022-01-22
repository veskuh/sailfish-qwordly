import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Column {
        anchors.fill: parent
        PageHeader {
            title: "About"
        }
        LinkedLabel {
            plainText: "This game is based on excellent online game called Wordle
- https://www.powerlanguage.co.uk/wordle/ Original game works very well in Sailfish Browser.
\If you want to play with English words you should check the original. This Sailfish version only supports finnish words for now\n\n
This Sailfish version is licensed under BSD and authored by Vesa-Matti Hartikainen See github for sources https://github.com/veskuh"
            width: page.width - 2 * Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            shortenUrl: true
        }


        SectionHeader {
            text: "How to play"
        }
        Label {
            text: "You are trying to guess a finnish word, which is 5 letters long.\
You have six attempts. Enter the word with keys at the bottom of the screen.\
Once you have inputted 5 letter word you can press enter to submit your guess.\
After your guess correct letters that are in correct place are highlighted\
in <i>green</i> and correct letters in wrong position are highlighted with <b style=\"color:orange;\">orange</b>. On the keypad additionally wrong letters are marked in <a>red</a>."
            width: page.width - 2 * Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.highlightColor
            wrapMode: Text.WordWrap



        }
    }
}
