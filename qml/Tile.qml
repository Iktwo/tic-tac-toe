import QtQuick 2.0

Rectangle {
    property GameLogic logic
    property int idx

    signal gameWon(int player)

    width: 100
    height: 100

    color: logic.status[idx] === 0 ? "white" : logic.status[idx] === 1 ? "green" : "red"

    Text {
        anchors.centerIn: parent
        text: logic.status[idx]//parent.width + "x" + parent.height
    }

    opacity: 0.3

    MouseArea {
        anchors.fill: parent

        enabled: logic.isGameActive

        onClicked: {
            if (!logic.status[idx]) {
                //logic.play(idx, logic.isFirstPlayersTurn ? 2 : 1)
                //console.log("Index:", idx)
                logic.status[idx] = logic.isFirstPlayersTurn ? 2 : 1
                logic.statusChanged()

                var won = logic.checkIfWin()

                logic.isFirstPlayersTurn = !logic.isFirstPlayersTurn

                if (won)
                    gameWon(won)
            }
        }
    }
}
