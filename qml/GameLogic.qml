import QtQuick 2.0

Item {
    property bool isGameActive: false
    property bool isFirstPlayersTurn: true
    property var status: ({ 0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0 })

    function reset() {
        for (var i = 0; i < 9; i++)
            status[i] = 0

        statusChanged()
    }

    function checkIfWin() {
        var i = 0
        var j = 0
        var count = 0
        for (j = 0; j < 3; j++) {
            count = 0

            for (i = 0; i < 3; i++) {
                if (status[i + j * 3] !== 0)
                    count += status[i + j * 3]
                else
                    break

                if (i == 2 && !(count % 3))
                    return count / 3
            }
        }

        for (j = 0; j < 3; j++) {
            count = 0

            for (i = 0; i < 3; i++) {
                if (status[j + i * 3] !== 0)
                    count += status[j + i * 3]
                else
                    break

                if (i == 2 && !(count % 3))
                    return count / 3
            }
        }

        count = 0
        for (i = 0; i < 3; i++) {

            if (status[i + i * 3] !== 0)
                count += status[i + i * 3]
            else
                break

            if (i == 2 && !(count % 3))
                return count / 3
        }

        count = 0
        for (i = 0; i < 3; i++) {
            //console.log("Check:", (i + 1) * 2)

            if (status[(i + 1) * 2] !== 0)
                count += status[(i + 1) * 2]
            else
                break

            if (i == 2 && !(count % 3))
                return count / 3
        }

        for (i = 0; i < 9; i++) {
            if (status[i] === 0)
                return 0
        }

        reset()
        //return 0
    }

    /*onStatusChanged: {
        for(var key in status)
            console.log("Status: ", status[key])
    }*/
}
