import QtQuick 2.0

Rectangle {
    width: 360
    height: 360

    Item {
        id: gameContainer

        anchors.fill: parent

        GameLogic {
            id: gameLogic
        }

        Repeater {
            model: 2

            Rectangle {
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                }

                color: "black"
                width: 2

                x: (index + 1) * parent.width / 3 - 1
            }
        }

        Repeater {
            model: 2

            Rectangle {
                anchors {
                    right: parent.right
                    left: parent.left
                }

                color: "black"
                height: 2

                y: (index + 1) * parent.height / 3 - 1
            }
        }

        Grid {
            anchors.fill: parent

            columns: 3

            Repeater {
                model: 9

                Tile {
                    height: gameContainer.height / 3
                    width: gameContainer.width / 3
                    logic: gameLogic
                    idx: index

                    onGameWon: {
                        textWon.visible = true
                        textWon.text = "Player " + player + " won"
                    }
                }
            }
        }

        Component.onCompleted: gameLogic.isGameActive = true
        /*MouseArea {
            anchors.fill: parent

            onClicked: {

                console.log(mouseX, mouseY)
            }
        }*/
    }

    Text {
        id: textWon

        visible: false
    }

    MouseArea {
        anchors.fill: parent

        enabled: textWon.visible

        onClicked: {
            gameLogic.reset()
            textWon.visible = false
        }
    }
}
