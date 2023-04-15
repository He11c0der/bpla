import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12

Window {
    property int rand: 0
    property int methodOfSeeking: 1 //1 - восьмерка //2-Параллельное галсирование
    // property bool seek: false
    property int nmbrSqr_8: 0
    property int nmbrIncrmnt: 1
    // property int nmbrSqr_onTop: 12
    property int nmbrSqr_onBottom: 0
    property int xBPLA: 25
    property int yBPLA_8: 50
    // property int yBPLA_DG_onTop: 175
    property int yBPLA_DG_onBot: 25
    property int cntrUp: 0
    // property var arr : new Array(50)
    property var rprtr: itmMap.rptr
    property var bpla_8: itmMap.rctnglBPLA_8
    // property var bpla_DG_onTop: itmMap.rctnglBPLA_onTop_doubleGals
    property var bpla_DG_onBot: itmMap.rctnglBPLA_onBot_doubleGals
    property var anmtn_DG: itmMap.prllAnmtnDoubleGals
    //property int : value
    //property int yy:  yBPLA[0].y_8
    property int cntrTimer: 0
    property int indxTurn: 0

    property int cntrTurn: 0
    property int prmtrVector: 2
    property var arrSqr: ["qrc:/image/image/imgMap/imgSquareMap/sqr1.png", "qrc:/image/image/imgMap/imgSquareMap/sqr2.png", "qrc:/image/image/imgMap/imgSquareMap/sqr3.png", "qrc:/image/image/imgMap/imgSquareMap/sqr4.png", "qrc:/image/image/imgMap/imgSquareMap/sqr5.png", "qrc:/image/image/imgMap/imgSquareMap/sqr6.png", "qrc:/image/image/imgMap/imgSquareMap/sqr7.png", "qrc:/image/image/imgMap/imgSquareMap/sqr8.png", "qrc:/image/image/imgMap/imgSquareMap/sqr9.png", "qrc:/image/image/imgMap/imgSquareMap/sqr10.png", "qrc:/image/image/imgMap/imgSquareMap/sqr11.png", "qrc:/image/image/imgMap/imgSquareMap/sqr12.png", "qrc:/image/image/imgMap/imgSquareMap/sqr13.png", "qrc:/image/image/imgMap/imgSquareMap/sqr14.png", "qrc:/image/image/imgMap/imgSquareMap/sqr15.png", "qrc:/image/image/imgMap/imgSquareMap/sqr16.png", "qrc:/image/image/imgMap/imgSquareMap/sqr17.png", "qrc:/image/image/imgMap/imgSquareMap/sqr18.png", "qrc:/image/image/imgMap/imgSquareMap/sqr19.png", "qrc:/image/image/imgMap/imgSquareMap/sqr20.png", "qrc:/image/image/imgMap/imgSquareMap/sqr21.png", "qrc:/image/image/imgMap/imgSquareMap/sqr22.png", "qrc:/image/image/imgMap/imgSquareMap/sqr23.png", "qrc:/image/image/imgMap/imgSquareMap/sqr24.png", "qrc:/image/image/imgMap/imgSquareMap/sqr25.png", "qrc:/image/image/imgMap/imgSquareMap/sqr26.png", "qrc:/image/image/imgMap/imgSquareMap/sqr27.png", "qrc:/image/image/imgMap/imgSquareMap/sqr28.png", "qrc:/image/image/imgMap/imgSquareMap/sqr29.png", "qrc:/image/image/imgMap/imgSquareMap/sqr30.png", "qrc:/image/image/imgMap/imgSquareMap/sqr31.png", "qrc:/image/image/imgMap/imgSquareMap/sqr32.png", "qrc:/image/image/imgMap/imgSquareMap/sqr33.png", "qrc:/image/image/imgMap/imgSquareMap/sqr34.png", "qrc:/image/image/imgMap/imgSquareMap/sqr35.png", "qrc:/image/image/imgMap/imgSquareMap/sqr36.png"]

    property var lMdlLib: lMdl.lMldLib
    id: mainWin
    width: 740
    height: 680
    visible: true
    title: qsTr("BPLA")

    Timer {
        id: tmr
        interval: 300
        running: false
        repeat: true
        onTriggered: {

            switch (methodOfSeeking) {
            case 1:
                method_8()
                break
            case 2:
                methodDoubleGals()
                if ((bpla_DG_onBot.x == 25) && (bpla_DG_onBot.y == 400)) {
                    stop()
                }
                break
            case 3:
                methodExpSquare()
                cntrTurn++
                if (cntrTurn == prmtrVector) {
                    indxTurn *= -1
                    prmtrVector += 2
                    cntrTurn = 0
                }
                break
            }
        }
    }
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        color: "#592e2e"
        radius: 1
        border.color: "#424242"
        border.width: 5
        width: 740
        height: 680
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#868f96"
            }

            GradientStop {
                position: 1
                color: "#596164"
            }
            orientation: Gradient.Vertical
        }
    }
    SwipeView {
        id: swpMain
        x: 0
        y: 0
        width: 740
        height: 680
        currentIndex: 0
        interactive: true

        Item {
            id: strtItm
            width: 740
            height: 680

            Rectangle {
                id: rectangle1
                x: 8
                y: 8
                width: 471
                height: 460
                color: "#c6c4c4"
                radius: 5
                border.color: "#e0d9d9"
                border.width: 2

                SwipeView {
                    property int crntIndxSvwMap: 1
                    x: 12
                    y: 6
                    id: swpMap
                    width: 448
                    height: 448
                    clip: true
                    currentIndex: crntIndxSvwMap
                    ItmMap {
                        id: itmMap
                        x: 11
                        y: 3
                        width: 448
                        height: 448
                    }

                    Item {
                        id: square
                        x: 11
                        y: 3
                        width: 448
                        height: 448
                        ItmSquare {
                            anchors.fill: parent
                            sqrHeigth: parent.height + 30
                            sqrWidth: parent.width + 10
                            imgSquare: arrSqr[rand]
                            Text {
                                id: txtS
                                text: rand
                                font.pointSize: 21
                                anchors.centerIn: parent
                            }
                        }
                    }
                }
            }

            Frame {
                id: frame
                x: 495
                y: 34
                width: 229
                height: 434

                Rectangle {
                    id: rectangle2
                    x: -12
                    y: 348
                    width: 229
                    height: 75
                    color: "#ffffff"
                    border.color: "#bebdbd"
                    border.width: 2
                    gradient: Gradient {
                        orientation: Gradient.Vertical
                        GradientStop {
                            position: 0
                            color: "#cbd1d7"
                        }

                        GradientStop {
                            position: 1
                            color: "#485563"
                        }
                    }
                }

                Image {
                    id: imgSeek
                    x: -6
                    y: 355
                    width: 63
                    height: 56
                    source: "qrc:/image/image/search-transformed.png"
                    fillMode: Image.PreserveAspectFit

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            imgSeek.opacity = 0.8
                        }
                        onClicked: {
                            tmr.start()
                        }
                        onPressed: {
                            imgSeek.opacity = 0.5
                        }
                        onReleased: {
                            imgSeek.opacity = 1
                        }
                        onExited: {
                            imgSeek.opacity = 1
                        }
                    }
                }

                ToolSeparator {
                    id: toolSeparator
                    x: 141
                    y: 355
                    width: 13
                    height: 56
                }

                Image {
                    id: imgPause
                    x: 72
                    y: 355
                    width: 63
                    height: 56
                    source: "qrc:/image/image/imgMainPage/pause.png"
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        id: msaImgPause
                        anchors.fill: parent
                        onEntered: {
                            imgPause.opacity = 0.8
                        }
                        onReleased: {
                            imgPause.opacity = 1
                        }
                        onExited: {
                            imgPause.opacity = 1
                        }
                        onPressed: {
                            imgPause.opacity = 0.5
                        }
                        onClicked: {
                            tmr.stop()
                        }
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                Image {
                    id: imgRpt
                    x: 148
                    y: 355
                    width: 63
                    height: 56
                    source: "qrc:/image/image/imgMainPage/repeat.png"
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        id: msaImgRpt
                        anchors.fill: parent
                        onEntered: {
                            imgRpt.opacity = 0.8
                        }
                        onReleased: {
                            imgRpt.opacity = 1
                        }
                        onExited: {
                            imgRpt.opacity = 1
                        }
                        onPressed: {
                            imgRpt.opacity = 0.5
                        }
                        onClicked: {
                            restart()
                        }
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }

                ToolSeparator {
                    id: toolSeparator1
                    x: 58
                    y: 355
                    width: 13
                    height: 56
                }
            }

            Label {
                id: lblIntlgncType
                x: 558
                y: 12
                color: "#ffffff"
                text: qsTr("Виды разведки")
                font.bold: true
                font.pointSize: 10
            }

            Frame {
                id: frame1
                x: 12
                y: 541
                width: 712
                height: 131

                Pane {
                    id: pane1
                    x: 0
                    y: 27
                    width: 108
                    height: 80
                }

                Pane {
                    id: pane2
                    x: 122
                    y: 27
                    width: 108
                    height: 80
                }

                Pane {
                    id: pane3
                    x: 244
                    y: 27
                    width: 108
                    height: 80
                }
            }

            Label {
                id: label1
                x: 25
                y: 519
                color: "#ffffff"
                text: qsTr("Данные по разведке")
                font.bold: true
                font.pointSize: 10
            }

            Label {
                id: label2
                x: 17
                y: 541
                width: 115
                height: 35
                color: "#ffffff"
                text: qsTr("Тепловизионная разведка")
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                font.italic: false
                font.underline: false
                font.family: "Tahoma"
                font.bold: false
                font.pointSize: 10
            }

            Label {
                id: label3
                x: 138
                y: 541
                width: 115
                height: 35
                color: "#ffffff"
                text: qsTr("Инфракрасная разведка")
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                font.italic: false
                font.underline: false
                font.family: "Tahoma"
                font.bold: false
                font.pointSize: 10
            }

            Label {
                id: label4
                x: 269
                y: 541
                width: 102
                height: 35
                color: "#ffffff"
                text: qsTr("Звуковая разведка")
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                font.italic: false
                font.underline: false
                font.family: "Tahoma"
                font.bold: false
                font.pointSize: 10
            }

            Rectangle {
                id: rctnglLib
                x: 544
                y: 550
                width: 101
                height: 81
                color: "#d7d5d5"
                radius: 4
                border.color: "#484747"
                gradient: Gradient {
                    orientation: Gradient.Vertical
                    GradientStop {
                        position: 0
                        color: "#cbd1d7"
                    }

                    GradientStop {
                        position: 1
                        color: "#485563"
                    }
                }
                Image {
                    id: imgLib
                    x: 8
                    y: 8
                    width: 85
                    height: 65
                    source: "qrc:/image/image/imgMainPage/imgLib.png"
                    fillMode: Image.PreserveAspectFit
                }

                Label {
                    id: lblLib
                    x: -18
                    y: 79
                    color: "#ffffff"
                    text: qsTr("Библиотека портретов обьектов")
                    font.family: "Tahoma"
                    font.bold: true
                    font.pointSize: 9
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                MouseArea {
                    id: msaLib
                    anchors.fill: parent
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 1
                    anchors.topMargin: 0
                    onReleased: {
                        imgLib.opacity = 1
                    }
                    onClicked: {
                        //lMdlLib.clear()
                        //cntrSwpLib = 0
                        swpMain.currentIndex = 1
                        // onPageType()
                        // conf()
                    }
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onExited: {
                        imgLib.opacity = 1
                    }
                    onPressed: {
                        imgLib.opacity = 0.5
                    }
                    onEntered: {
                        imgLib.opacity = 0.8
                    }
                }
            }
            RadioButton {
                id: radioButton
                x: 536
                y: 44
                text: qsTr("Восьмерка")
                font.pointSize: 10
                font.bold: true
                onClicked: {
                    methodOfSeeking = 1
                    sceneBPLA(methodOfSeeking)
                    bpla_8.x = 0
                    bpla_8.y = 25
                    indxTurn = 0
                    xBPLA = 25
                    yBPLA_8 = 50
                    nmbrSqr_8 = 0
                }
            }
            RadioButton {
                id: radioButton1
                x: 539
                y: 142
                text: qsTr("Галсирование")
                font.pointSize: 10
                font.bold: true
                onClicked: {
                    methodOfSeeking = 2
                    sceneBPLA(methodOfSeeking)
                    indxTurn = 0
                    xBPLA = 25
                }
            }

            RadioButton {
                id: radioButton2
                x: 500
                y: 218
                text: qsTr("Расширяющийся квадрат")
                font.pointSize: 10
                font.bold: true
                onClicked: {
                    methodOfSeeking = 3
                    sceneBPLA(methodOfSeeking)
                    bpla_8.x = 175
                    bpla_8.y = 175
                    indxTurn = 1
                    xBPLA = 150
                    yBPLA_8 = 175
                    nmbrSqr_8 = 14
                }
            }
        }

        LibObj {
            id: itmLibObj
        }
    }
    Lmdl {
        id: lMdl
    }

    function randomize(range) {
        return (Math.random() * range)
    }
    function inArea() {

        // console.log("x:" + rectangle.x)
        // console.log(rptr.itemAt(nmbrSqr).x+25)
        //console.log("y:" + rectangle.y)

        //  console.log(rptr.itemAt(nmbrSqr).y+25)

        //console.log(rptr.itemAt().x + 25)
        //console.log(i)
        switch (methodOfSeeking) {
        case 1:
            if ((bpla_8.x === (rprtr.itemAt(nmbrSqr_8).x + 25))
                    && (bpla_8.y === (rprtr.itemAt(nmbrSqr_8).y + 25))) {
                console.log("Переход в новый квадрат поиска")
                console.log(nmbrSqr_8)
                if (nmbrSqr_8 == rand) {
                    console.log("Обьект найден")
                    rprtr.itemAt(nmbrSqr_8).color = "green"
                    swpMap.currentIndex = 1
                    tmr.stop()
                }
                nmbrSqr_8 += nmbrIncrmnt
            }
            break
        case 2:

            if (((bpla_DG_onBot.x === (rprtr.itemAt(nmbrSqr_onBottom).x + 25))
                 && (bpla_DG_onBot.y === (rprtr.itemAt(
                                              nmbrSqr_onBottom).y + 25)))) {
                console.log("Переход в новый квадрат поиска")
                console.log(bpla_DG_onBot + "-" + nmbrSqr_onBottom)
                if ((nmbrSqr_onBottom == rand)) {
                    //var obj =
                    console.log("Обьект найден")
                    rprtr.itemAt(rand).color = "green"
                    swpMap.currentIndex = 1
                    tmr.stop()
                }

                // nmbrSqr_onTop += nmbrIncrmnt
                nmbrSqr_onBottom += nmbrIncrmnt
            }
            break
        case 3:
            if ((bpla_8.x === (rprtr.itemAt(nmbrSqr_8).x + 25))
                    && (bpla_8.y === (rprtr.itemAt(nmbrSqr_8).y + 25))) {
                console.log("Переход в новый квадрат поиска")
                console.log(nmbrSqr_8)
                if (nmbrSqr_8 == rand) {
                    console.log("Обьект найден")
                    rprtr.itemAt(nmbrSqr_8).color = "green"
                    swpMap.currentIndex = 1
                    tmr.stop()
                }
            }
            break
        }
    }
    function methodDoubleGals() {

        //Направление
        //Вверх/Вниз
        if (((bpla_DG_onBot.x == 400))) {
            switch (bpla_DG_onBot.y) {
            case 25:

                // nmbrSqr_onTop = 11
                nmbrSqr_onBottom = 11
                indxTurn = 1

                nmbrIncrmnt = -1
                //xBPLA-=25
                break
                //            case 100:

                //                nmbrSqr_onBottom = 17
                //                indxTurn = 1
                //                console.log("s")
                //                nmbrIncrmnt = -1
                //                break
            case 175:
                nmbrSqr_onBottom = 23
                indxTurn = 1

                nmbrIncrmnt = -1
                break
                //            case 250:
                //                nmbrSqr_onBottom = 23
                //                indxTurn = 1

                //                nmbrIncrmnt = -1
                //                break
            case 325:
                nmbrSqr_onBottom = 29
                indxTurn = 1

                nmbrIncrmnt = -1
                break
            }
        }
        if (((bpla_DG_onBot.x == 25))) {
            switch (bpla_DG_onBot.y) {
            case 100:

                // nmbrSqr_onTop = 11
                nmbrSqr_onBottom = 12
                indxTurn = 3
                nmbrIncrmnt = 1
                //xBPLA-=25
                break
                //            case 175:

                //                nmbrSqr_onBottom = 12
                //                indxTurn = 3
                //                nmbrIncrmnt = 1
                //                break
            case 250:
                nmbrSqr_onBottom = 24
                indxTurn = 3
                nmbrIncrmnt = 1
                break
                //            case 325:
                //                nmbrSqr_onBottom = 24
                //                indxTurn = 3
                //                nmbrIncrmnt = 1
                //                break
            case 400:
                nmbrSqr_onBottom = 30
                indxTurn = 3
                nmbrIncrmnt = 1
                break
            }
        }
        //        if((rctnglBPLA_onTop_doubleGals.x == 25)&&(rctnglBPLA_onTop_doubleGals.y==400))
        //        {

        //        indxNapr = 0
        //            nmbrIncrmnt=1
        //        }
        //        if((rctnglBPLA_8.x == 400)&&(rctnglBPLA_8.y==400))
        //        {
        //        indxNapr = 2
        //               nmbrIncrmnt=-7
        //        }
        //        if ((bpla_DG_onBot.x == 0) && (bpla_DG_onBot.y == 25)) {
        //            indxTurn = 0
        //            nmbrIncrmnt = 1
        //            //stop()
        //        }
        inArea()
        //Движение
        switch (indxTurn) {
            //вправо
        case 0:
            anmtn_DG.start()
            anmtn_DG.complete()
            xBPLA += 25
            break
            //вверх(влево)
        case 1:
            anmtn_DG.start()
            anmtn_DG.complete()

            yBPLA_DG_onBot += 75
            // yBPLA_DG_onTop -= 75
            indxTurn = 2

            break

            //влево
        case 2:
            anmtn_DG.start()
            anmtn_DG.complete()

            xBPLA -= 25

            break
        case 3:
            anmtn_DG.start()
            anmtn_DG.complete()

            yBPLA_DG_onBot += 75
            // yBPLA_DG_onTop -= 75
            indxTurn = 0
            break
        }
    }
    function method_8() {

        if ((bpla_8.x == 400) && (bpla_8.y == 25)) {
            indxTurn = 1
            xBPLA -= 50
            nmbrIncrmnt = 5
        }

        if ((bpla_8.x == 25) && (bpla_8.y == 400)) {

            indxTurn = 0
            nmbrIncrmnt = 1
        }
        if ((bpla_8.x == 400) && (bpla_8.y == 400)) {
            indxTurn = 2
            nmbrIncrmnt = -7
        }
        if ((bpla_8.x == 25) && (bpla_8.y == 25)) {
            indxTurn = 0
            nmbrIncrmnt = 1
            //stop()
        }
        inArea()
        switch (indxTurn) {
        case 0:

            itmMap.xAnmtn.start()
            itmMap.xAnmtn.complete()
            xBPLA += 25
            break
        case 1:
            itmMap.xAnmtn.start()
            itmMap.yAnmtn.start()
            itmMap.xAnmtn.complete()
            itmMap.yAnmtn.complete()
            xBPLA -= 25
            yBPLA_8 += 25
            break
        case 2:
            itmMap.xAnmtn.start()
            itmMap.yAnmtn.start()
            itmMap.xAnmtn.complete()
            itmMap.yAnmtn.complete()
            xBPLA -= 25
            yBPLA_8 -= 25
            break
        }
    }
    function methodExpSquare() {
        inArea()
        if (tmr.running) {
            if (cntrTurn <= prmtrVector) {

                if (cntrTurn >= prmtrVector / 2) {

                    bpla_8.y += 75 * indxTurn
                    nmbrSqr_8 += 6 * indxTurn
                    //itmMap.yAnmtn.start()
                    // itmMap.yAnmtn.complete()
                } else {

                    bpla_8.x += 75 * indxTurn
                    nmbrSqr_8 += indxTurn
                    //itmMap.xAnmtn.start()
                    //itmMap.xAnmtn.complete()
                }
            }
        }
    }
    function sceneBPLA(a) {
        switch (a) {
        case 1:
            bpla_8.visible = true
            bpla_DG_onBot.visible = false
            //bpla_DG_onTop.visible = false
            break
        case 2:
            bpla_8.visible = false
            bpla_DG_onBot.visible = true
            //bpla_DG_onTop.visible = true
            break
        case 3:
            bpla_8.visible = true
            bpla_DG_onBot.visible = false
            // bpla_DG_onTop.visible = false
            break
        }
    }

    Component.onCompleted: {
        //var yBPLA=[{"y_8":50},{"y_g_top":325}]
        //arr["first"] = 50
        //console.log(arr["first"])
        //console.log(yBPLA[0].y_8 + 25)
        rand = randomize(35)
        console.log("Искомый обьект находится в квадрате " + rand)
    }
    function restart() {
        tmr.stop()
        //indxTurn = 0
        switch (methodOfSeeking) {
        case 1:
            indxTurn = 0
            bpla_8.y = 25
            bpla_8.x = 0
            xBPLA = 25
            yBPLA_8 = 50
            nmbrSqr_8 = 0
            break
        case 2:
            indxTurn = 0
            cntrUp = 0
            nmbrSqr_onBottom = 0

            //  nmbrSqr_onTop = 12
            nmbrIncrmnt = 1
            xBPLA = 25
            bpla_DG_onBot.x = 0

            //bpla_DG_onTop.x = 0
            bpla_DG_onBot.y = 25
            // bpla_DG_onTop.y = 175
            // xBPLA = 25
            //  yBPLA_8 = 50
            //yBPLA_DG_onTop = 175
            yBPLA_DG_onBot = 25
            break
        case 3:
            bpla_8.x = 175
            bpla_8.y = 175
            indxTurn = 1
            xBPLA = 150
            yBPLA_8 = 175
            nmbrSqr_8 = 14
            prmtrVector = 2
            cntrTurn = 0
            break
        }
        rprtr.itemAt(rand).color = "#b83c3c"
        tmr.restart()
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/

