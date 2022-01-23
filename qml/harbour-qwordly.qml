import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    id: window

    initialPage: Component { GamePage { } }
    allowedOrientations: defaultAllowedOrientations

    cover: CoverBackground {
        id: cover
        Grid {
            anchors.centerIn: parent
            columns: 5
            spacing: 10

            Repeater {
                id: colorGrid
                model: 30
                Rectangle {
                    width: cover.width / 6
                    height: width
                    color: "black"
                }
            }
        }
        CoverActionList {
        }
    }

    function setCoverColor(index, color) {
        if (colorGrid.itemAt(index)!==null) {
            colorGrid.itemAt(index).color = color
        }
    }
}
