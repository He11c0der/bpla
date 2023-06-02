import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQml.Models 2.12

Window {
    property int randObjOne: -1 //Номер квадрата 1 объекта
    property int randObjTwo: -1 //Номер квадрата 2 объекта
    property int randObjThree: -1 //Номер квадрата 3 объекта
    property var arrObj: ["Танк", "Машина", "Электростанция"]
    property var arrRndInSqr: [-1, -1, -1]
    property var arrRnd: [randObjOne, randObjTwo, randObjThree]
    property string txtPp: ""
    property int nmbrSqrPp: 0
    property double tmOfFly: 0
    property int cntrJrnl: 1
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
    property int evadeSqr: 0
    //property int : value
    //property int yy:  yBPLA[0].y_8
    property int cntrTimer: 0
    property int indxTurn: 0

    property int cntrTurn: 0
    property int prmtrVector: 2
    property var arrSqr: ["qrc:/image/image/imgMap/imgSquareMap/sqr1.png", "qrc:/image/image/imgMap/imgSquareMap/sqr2.png", "qrc:/image/image/imgMap/imgSquareMap/sqr3.png", "qrc:/image/image/imgMap/imgSquareMap/sqr4.png", "qrc:/image/image/imgMap/imgSquareMap/sqr5.png", "qrc:/image/image/imgMap/imgSquareMap/sqr6.png", "qrc:/image/image/imgMap/imgSquareMap/sqr7.png", "qrc:/image/image/imgMap/imgSquareMap/sqr8.png", "qrc:/image/image/imgMap/imgSquareMap/sqr9.png", "qrc:/image/image/imgMap/imgSquareMap/sqr10.png", "qrc:/image/image/imgMap/imgSquareMap/sqr11.png", "qrc:/image/image/imgMap/imgSquareMap/sqr12.png", "qrc:/image/image/imgMap/imgSquareMap/sqr13.png", "qrc:/image/image/imgMap/imgSquareMap/sqr14.png", "qrc:/image/image/imgMap/imgSquareMap/sqr15.png", "qrc:/image/image/imgMap/imgSquareMap/sqr16.png", "qrc:/image/image/imgMap/imgSquareMap/sqr17.png", "qrc:/image/image/imgMap/imgSquareMap/sqr18.png", "qrc:/image/image/imgMap/imgSquareMap/sqr19.png", "qrc:/image/image/imgMap/imgSquareMap/sqr20.png", "qrc:/image/image/imgMap/imgSquareMap/sqr21.png", "qrc:/image/image/imgMap/imgSquareMap/sqr22.png", "qrc:/image/image/imgMap/imgSquareMap/sqr23.png", "qrc:/image/image/imgMap/imgSquareMap/sqr24.png", "qrc:/image/image/imgMap/imgSquareMap/sqr25.png", "qrc:/image/image/imgMap/imgSquareMap/sqr26.png", "qrc:/image/image/imgMap/imgSquareMap/sqr27.png", "qrc:/image/image/imgMap/imgSquareMap/sqr28.png", "qrc:/image/image/imgMap/imgSquareMap/sqr29.png", "qrc:/image/image/imgMap/imgSquareMap/sqr30.png", "qrc:/image/image/imgMap/imgSquareMap/sqr31.png", "qrc:/image/image/imgMap/imgSquareMap/sqr32.png", "qrc:/image/image/imgMap/imgSquareMap/sqr33.png", "qrc:/image/image/imgMap/imgSquareMap/sqr34.png", "qrc:/image/image/imgMap/imgSquareMap/sqr35.png", "qrc:/image/image/imgMap/imgSquareMap/sqr36.png"]

    property var lMdlLib: lMdl.lMldLib
    property var urlImgLibTplvsn: itmLibObj.urlImgTplvsn
    property var urlImgLibVlm: itmLibObj.urlImgAcoustic
    property int frmTplvsn: 0 //0 - отсутствие тепловизионного портрета; 1 - наличие тепловизионного портрета
    property int cntrStopSqr: 0
    property int frmRed: 0 //0 - отсутствие инфракрасного портрета; 1 - наличие тепловизионного портрета
    property int indxBlck: 0
    property int frmVlm: 0 //0 - отсутствие звукового портрета; 1 - наличие тепловизионного портрета
    property int cntrMethod8: 0
    property int indxSqrOrMap: 0
    property var arrBpla_8: [bpla_8, itmSqr.rctnglBPLA_8_sqr]
    property var arrBplaSqr: [bpla_DG_onBot, itmSqr.rctnglBPLA_onBot_doubleGals_sqr]
    property var arrRptr: [rprtr, itmSqr.rptrSqr]
    property var arrAnmtnDG: [anmtn_DG, itmSqr.prllAnmtnDoubleGals_sqr]
    property var arrAnmtnX: [itmMap.xAnmtn, itmSqr.xAnmtn_sqr]
    property var arrAnmtnY: [itmMap.yAnmtn, itmSqr.yAnmtn_sqr]
    id: mainWin
    width: 740
    height: 680
    minimumHeight: height
    maximumHeight: height
    minimumWidth: width
    maximumWidth: width
    visible: true
    title: qsTr("BPLA")
    Popup {
        id: ppMsg
        width: 500
        height: (swpMap.currentIndex == 0) ? 200 : 150
        //opacity: 0.9
        modal: true
        focus: true
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        Rectangle {
            id: rctnglPp
            anchors.fill: parent

            // color: "green"
            radius: 2
            border.color: "#f80707"
            border.width: 3
            gradient: Gradient {
                GradientStop {
                    position: 0.00
                    color: "#f4d03f"
                }
                GradientStop {
                    position: 1.00
                    color: "#16a085"
                }
            }
            Column {
                id: clmnPp
                anchors.fill: parent

                spacing: 53

                // z: 2
                Text {
                    id: txtAttntn
                    color: "red"
                    //  visible: false
                    text: (swpMap.currentIndex
                           == 0) ? ("В квадрате №" + nmbrSqrPp
                                    + " возможно нахождение объекта типа "
                                    + txtPp) : ("В квадрате №" + nmbrSqrPp
                                                + " найден объект типа " + txtPp)
                    anchors.top: parent.top
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 50
                    //  anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                    font.family: "Tahoma"
                }

                Button {
                    id: btnPpStart
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 70
                    text: "Продолжить поиск объектов в районе"
                    onClicked: {
                        if (swpMap.currentIndex == 1) {
                            swpMap.currentIndex = 0
                            indxSqrOrMap = 0
                            arrRndInSqr = [-1, -1, -1]
                            //restart()
                        }

                        console.log(indxSqrOrMap)
                        ppMsg.close()
                        //tmr.start()
                    }
                }
                Button {
                    id: btnPpInSqr
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 120
                    visible: (swpMap.currentIndex == 0) ? true : false
                    text: "Перейти к поиску объекта в квадрате"
                    onClicked: {
                        ppMsg.close()
                        swpMap.currentIndex = 1
                        indxSqrOrMap = 1
                        switch (methodOfSeeking) {
                        case 1:
                            indxTurn = 0
                            arrBpla_8[indxSqrOrMap].y = 25
                            arrBpla_8[indxSqrOrMap].x = 0
                            xBPLA = 25
                            yBPLA_8 = 50
                            nmbrSqr_8 = 0
                            cntrMethod8 = 0
                            break
                        case 2:
                            indxTurn = 0
                            cntrUp = 0
                            nmbrSqr_onBottom = 0

                            //  nmbrSqr_onTop = 12
                            nmbrIncrmnt = 1
                            xBPLA = 25
                            arrBplaSqr[indxSqrOrMap].x = 0

                            //bpla_DG_onTop.x = 0
                            arrBplaSqr[indxSqrOrMap].y = 25
                            // bpla_DG_onTop.y = 175
                            // xBPLA = 25
                            //  yBPLA_8 = 50
                            //yBPLA_DG_onTop = 175
                            yBPLA_DG_onBot = 25
                            break
                        case 3:
                            arrBpla_8[indxSqrOrMap].x = 175
                            arrBpla_8[indxSqrOrMap].y = 175
                            indxTurn = 1
                            xBPLA = 150
                            yBPLA_8 = 175
                            nmbrSqr_8 = 14
                            prmtrVector = 2
                            cntrTurn = 0
                            break
                        }
                    }
                }
            }
        }
    }
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
                if ((arrBplaSqr[indxSqrOrMap].x == 25)
                        && (arrBplaSqr[indxSqrOrMap].y == 400)) {
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
        clip: true
        Item {
            id: strtItm
            width: 740
            height: 680

            GroupBox {
                id: groupBox1
                x: 495
                y: 206
                width: 229
                height: 189
                font.underline: true
                font.bold: true
                font.pointSize: 8
                title: qsTr("Объекты поиска")
            }

            GroupBox {
                id: groupBox
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 34
                anchors.bottomMargin: 472
                anchors.leftMargin: 495
                anchors.rightMargin: 16
                font.underline: true
                font.bold: true
                title: qsTr("Способы ведения разведки")
            }

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
                    property int crntIndxSvwMap: 0
                    x: 12
                    y: 6
                    id: swpMap
                    width: 448
                    height: 448
                    clip: true
                    orientation: Qt.Vertical
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

                        width: 448
                        height: 448
                        ItmSquare {
                            id: itmSqr
                            anchors.fill: parent
                            x: Math.round((parent.width - width) / 2)
                            y: Math.round((parent.height - height) / 2)
                            sqrHeigth: parent.height + 90
                            sqrWidth: parent.width + 40
                            imgSquare: arrSqr[nmbrSqrPp]

                            Text {
                                id: txtS
                                text: nmbrSqrPp
                                font.pointSize: 21
                                anchors.centerIn: parent
                            }
                        }
                    }
                }

                TabBar {
                    id: tabBar
                    x: 122
                    y: 460
                    width: 240
                    visible: false

                    TabButton {
                        id: tabButton
                        text: qsTr("Карта")
                        onClicked: {
                            indxSqrOrMap = 0
                            swpMap.currentIndex = 0
                        }
                    }

                    TabButton {
                        id: tabButton1
                        visible: false
                        text: qsTr("Квадрат")
                        onClicked: {
                            indxSqrOrMap = 1
                            swpMap.currentIndex = 1
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
                    source: "qrc:/image/image/imgMainPage/play.png"
                    fillMode: Image.PreserveAspectFit
                    enabled: (((!checkBox.checked) && (!checkBox1.checked)
                               && (!checkBox2.checked))
                              || (indxBlck == 0)) ? false : true
                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            imgSeek.opacity = 0.8
                        }
                        onClicked: {

                            //                            if (checkBox.checked) {
                            //                                randObjOne = randomize(35)
                            //                            }
                            //                            if (checkBox1.checked) {
                            //                                randObjTwo = randomize(35)
                            //                            }
                            //                            if (checkBox2.checked) {
                            //                                randObjThree = randomize(35)
                            //                            }
                            tmr.start()
                            timeOfFly.start()
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
                    enabled: (((!checkBox.checked) && (!checkBox1.checked)
                               && (!checkBox2.checked))
                              || (indxBlck == 0)) ? false : true
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
                            timeOfFly.stop()
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
                    enabled: (((!checkBox.checked) && (!checkBox1.checked)
                               && (!checkBox2.checked))
                              || (indxBlck == 0)) ? false : true
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

                CheckBox {
                    //property int cntr_: 0
                    id: checkBox
                    x: 0
                    y: 247
                    width: 94
                    height: 40
                    text: qsTr("Танк")
                    font.bold: true

                    onClicked: {
                        if (checkBox.checked) {
                            randObjOne = randomize(35)
                        } else if (!checkBox.checked) {
                            randObjOne = -1
                        }
                        console.log(randObjOne)
                    }
                }

                CheckBox {
                    id: checkBox1
                    x: 0
                    y: 293
                    width: 114
                    height: 40
                    text: qsTr("Машина")
                    font.bold: true
                    onClicked: {
                        if (checkBox1.checked) {
                            randObjTwo = randomize(35)
                        } else if (!checkBox1.checked) {
                            randObjTwo = -1
                        }
                        console.log(randObjTwo)
                    }
                }

                CheckBox {
                    id: checkBox2
                    x: 0
                    y: 201
                    width: 184
                    height: 40
                    text: qsTr("Электростанция")
                    font.bold: true
                    onClicked: {
                        if (checkBox2.checked) {
                            randObjThree = randomize(35)
                        } else if (!checkBox2.checked) {
                            randObjThree = -1
                        }
                    }
                }
            }

            Frame {
                id: frame1
                x: 12
                y: 541
                width: 473
                height: 131

                Rectangle {
                    id: rctnglVlm
                    x: 324
                    y: 183
                    width: 108
                    height: 80
                    visible: false
                    color: "#00ffffff"
                    radius: 2
                    border.width: 1

                    Image {
                        id: imgVlm
                        anchors.fill: parent
                        source: "qrc:/image/image/imgMainPage/imgNotIdtfcnt.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Rectangle {
                    id: rectangle3
                    x: -12
                    y: -12
                    width: 473
                    height: 131
                    color: "#ffffff"
                    border.width: 2
                    ListView {
                        id: lv
                        anchors.fill: parent
                        anchors.bottomMargin: 0
                        cacheBuffer: 380
                        boundsMovement: Flickable.StopAtBounds
                        // boundsBehavior: Flickable.StopAtBounds
                        //snapMode: ListView.SnapToItem
                        // boundsMovement: Flickable.StopAtBounds
                        //  anchors.bottomMargin: 24
                        boundsBehavior: Flickable.DragAndOvershootBounds

                        keyNavigationWraps: true
                        spacing: 10
                        model: itmLmdlJrnl
                        delegate: contactDelegate
                        clip: true
                        focus: true
                        // ListView.PullBackHeader: true
                        Component {
                            id: contactDelegate

                            Item {
                                width: 180
                                height: 40
                                Column {
                                    spacing: -4
                                    Text {
                                        text: '<b>Отчет №</b> ' + mdl_nmbr
                                    }
                                    Text {
                                        text: '<b>Время поиска:</b> ' + mdl_time_seeking
                                    }
                                    Text {
                                        text: '<b>Результат поиска:</b> ' + mdl_result_seeking
                                    }
                                }
                            }
                        }
                    }
                }
            }
            ListModel {
                id: itmLmdlJrnl
            }
            Timer {
                id: timeOfFly
                running: false
                repeat: true
                interval: 100
                onTriggered: {
                    tmOfFly++
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

            Rectangle {
                id: rctnglLib
                x: 572
                y: 549
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
                    y: 84
                    color: "#ffffff"
                    text: qsTr("Библиотека портретов обьектов")
                    anchors.horizontalCenterOffset: 0
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
                x: 500
                y: 51
                text: qsTr("Восьмерка")
                font.pointSize: 10
                font.bold: true
                onClicked: {
                    indxBlck = 1
                    methodOfSeeking = 1
                    sceneBPLA(methodOfSeeking)
                    arrBpla_8[indxSqrOrMap].x = 0
                    arrBpla_8[indxSqrOrMap].y = 25
                    indxTurn = 0
                    xBPLA = 25
                    yBPLA_8 = 50
                    nmbrSqr_8 = 0
                }
            }

            RadioButton {
                id: radioButton1
                x: 500
                y: 106
                text: qsTr("Галсирование")
                font.pointSize: 10
                font.bold: true
                onClicked: {
                    indxBlck = 1
                    methodOfSeeking = 2
                    sceneBPLA(methodOfSeeking)
                    indxTurn = 0
                    xBPLA = 25
                }
            }

            RadioButton {
                id: radioButton2
                x: 500
                y: 160
                text: qsTr("Расширяющийся квадрат")
                font.pointSize: 10
                font.bold: true
                onClicked: {
                    indxBlck = 1
                    methodOfSeeking = 3
                    sceneBPLA(methodOfSeeking)
                    arrBpla_8[indxSqrOrMap].x = 175
                    arrBpla_8[indxSqrOrMap].y = 175
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
    function inSqr(nmbrSqr, i, indx) {
        switch (indx) {
        case 0:

            if (nmbrSqr == arrRnd[i]) {
                if (cntrStopSqr == 1) {

                    cntrStopSqr = 0
                } else {
                    console.log("Обьект найден")
                    nmbrSqrPp = nmbrSqr
                    txtPp = arrObj[i]
                    arrRndInSqr[i] = nmbrSqr
                    console.log(arrRndInSqr[0], arrRndInSqr[1], arrRndInSqr[2])
                    // rprtr.itemAt(nmbrSqr_8).color = "green"
                    //swpMap.currentIndex = 1
                    tmr.stop()
                    ppMsg.open()

                    itmLmdlJrnl.append({
                                           "mdl_nmbr": cntrJrnl,
                                           "mdl_time_seeking": tmOfFly,
                                           "mdl_result_seeking": txtAttntn.text
                                       })
                    cntrJrnl++
                    timeOfFly.stop()
                    cntrStopSqr = 1
                }
            }
            break
        case 1:
            if (nmbrSqr == arrRndInSqr[i]) {
                console.log("Обьект найден")
                nmbrSqrPp = nmbrSqr
                txtPp = arrObj[i]
                // rprtr.itemAt(nmbrSqr_8).color = "green"
                //swpMap.currentIndex = 1
                tmr.stop()
                ppMsg.open()

                itmLmdlJrnl.append({
                                       "mdl_nmbr": cntrJrnl,
                                       "mdl_time_seeking": tmOfFly,
                                       "mdl_result_seeking": txtAttntn.text
                                   })
                cntrJrnl++
                timeOfFly.stop()
            }

            break
        }
    }
    function inArea() {

        switch (methodOfSeeking) {
        case 1:
            if ((arrBpla_8[indxSqrOrMap].x === (arrRptr[indxSqrOrMap].itemAt(
                                                    nmbrSqr_8).x + 25))
                    && (arrBpla_8[indxSqrOrMap].y === (arrRptr[indxSqrOrMap].itemAt(
                                                           nmbrSqr_8).y + 25))) {
                console.log("Переход в новый квадрат поиска")
                console.log(nmbrSqr_8)
                for (var i = 0; i < arrRnd.length; i++) {
                    inSqr(nmbrSqr_8, i, indxSqrOrMap)
                }
                nmbrSqr_8 += nmbrIncrmnt
            }
            break
        case 2:

            if (((arrBplaSqr[indxSqrOrMap].x === (arrRptr[indxSqrOrMap].itemAt(
                                                      nmbrSqr_onBottom).x + 25))
                 && (arrBplaSqr[indxSqrOrMap].y === (arrRptr[indxSqrOrMap].itemAt(
                                                         nmbrSqr_onBottom).y + 25)))) {
                console.log("Переход в новый квадрат поиска")
                console.log(arrBplaSqr[indxSqrOrMap] + "-" + nmbrSqr_onBottom)
                for (var i = 0; i < arrRnd.length; i++) {
                    inSqr(nmbrSqr_onBottom, i, indxSqrOrMap)
                }
                // nmbrSqr_onTop += nmbrIncrmnt
                nmbrSqr_onBottom += nmbrIncrmnt
            }
            break
        case 3:
            if ((arrBpla_8[indxSqrOrMap].x === (arrRptr[indxSqrOrMap].itemAt(
                                                    nmbrSqr_8).x + 25))
                    && (arrBpla_8[indxSqrOrMap].y === (arrRptr[indxSqrOrMap].itemAt(
                                                           nmbrSqr_8).y + 25))) {
                console.log("Переход в новый квадрат поиска")
                console.log(nmbrSqr_8)

                for (var i = 0; i < arrRnd.length; i++) {

                    inSqr(nmbrSqr_8, i, indxSqrOrMap)
                }
            }
            break
        }
    }
    function methodDoubleGals() {

        //Направление
        //Вверх/Вниз
        if (((arrBplaSqr[indxSqrOrMap].x == 400))) {
            switch (arrBplaSqr[indxSqrOrMap].y) {
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
        if (((arrBplaSqr[indxSqrOrMap].x == 25))) {
            switch (arrBplaSqr[indxSqrOrMap].y) {
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
        arrAnmtnDG[indxSqrOrMap].start()
        arrAnmtnDG[indxSqrOrMap].complete()
        //Движение
        switch (indxTurn) {
            //вправо
        case 0:

            xBPLA += 25
            break
            //вверх(влево)
        case 1:

            yBPLA_DG_onBot += 75
            // yBPLA_DG_onTop -= 75
            indxTurn = 2

            break

            //влево
        case 2:

            xBPLA -= 25

            break
        case 3:

            yBPLA_DG_onBot += 75
            // yBPLA_DG_onTop -= 75
            indxTurn = 0
            break
        }
    }
    function method_8() {

        if ((arrBpla_8[indxSqrOrMap].x == 400)
                && (arrBpla_8[indxSqrOrMap].y == 25)) {
            indxTurn = 1
            xBPLA -= 50
            nmbrIncrmnt = 5
        }

        if ((arrBpla_8[indxSqrOrMap].x == 25)
                && (arrBpla_8[indxSqrOrMap].y == 400)) {

            indxTurn = 0
            nmbrIncrmnt = 1
        }
        if ((arrBpla_8[indxSqrOrMap].x == 400)
                && (arrBpla_8[indxSqrOrMap].y == 400)) {
            indxTurn = 2
            nmbrIncrmnt = -7
        }
        if ((arrBpla_8[indxSqrOrMap].x == 25)
                && (arrBpla_8[indxSqrOrMap].y == 25)) {
            indxTurn = 0
            nmbrIncrmnt = 1
            if (cntrMethod8 == 1) {
                tmr.stop()
                //cntrMethod8 = 0
            }
            if (indxSqrOrMap == 0) {
                cntrMethod8++
            }
            //stop()
        }
        inArea()
        switch (indxTurn) {
        case 0:

            arrAnmtnX[indxSqrOrMap].start()
            arrAnmtnX[indxSqrOrMap].complete()
            xBPLA += 25
            break
        case 1:
            arrAnmtnX[indxSqrOrMap].start()
            arrAnmtnY[indxSqrOrMap].start()
            arrAnmtnX[indxSqrOrMap].complete()
            arrAnmtnY[indxSqrOrMap].complete()
            xBPLA -= 25
            yBPLA_8 += 25
            break
        case 2:
            arrAnmtnX[indxSqrOrMap].start()
            arrAnmtnY[indxSqrOrMap].start()
            arrAnmtnX[indxSqrOrMap].complete()
            arrAnmtnY[indxSqrOrMap].complete()
            xBPLA -= 25
            yBPLA_8 -= 25
            break
        }
    }
    function methodExpSquare() {
        inArea()
        if ((tmr.running) || (evadeSqr == 1)) {
            if (cntrTurn <= prmtrVector) {

                if (cntrTurn >= prmtrVector / 2) {

                    arrBpla_8[indxSqrOrMap].y += 75 * indxTurn
                    nmbrSqr_8 += 6 * indxTurn
                    //itmMap.yAnmtn.start()
                    // itmMap.yAnmtn.complete()
                } else {

                    arrBpla_8[indxSqrOrMap].x += 75 * indxTurn
                    nmbrSqr_8 += indxTurn
                    //itmMap.xAnmtn.start()
                    //itmMap.xAnmtn.complete()
                }
            }
        }
        evadeSqr = 0
    }
    function sceneBPLA(a) {
        switch (a) {
        case 1:
            arrBpla_8[indxSqrOrMap].visible = true
            arrBplaSqr[indxSqrOrMap].visible = false
            //bpla_DG_onTop.visible = false
            break
        case 2:
            arrBpla_8[indxSqrOrMap].visible = false
            arrBplaSqr[indxSqrOrMap].visible = true
            //bpla_DG_onTop.visible = true
            break
        case 3:
            arrBpla_8[indxSqrOrMap].visible = true
            arrBplaSqr[indxSqrOrMap].visible = false
            // bpla_DG_onTop.visible = false
            break
        }
    }

    Component.onCompleted: {

        //var yBPLA=[{"y_8":50},{"y_g_top":325}]
        //arr["first"] = 50
        //console.log(arr["first"])
        //console.log(yBPLA[0].y_8 + 25)

        // console.log("Искомый обьект находится в квадрате " + randObjOne)
    }
    function restart() {
        tmr.stop()
        //indxTurn = 0
        switch (methodOfSeeking) {
        case 1:
            indxTurn = 0
            arrBpla_8[indxSqrOrMap].y = 25
            arrBpla_8[indxSqrOrMap].x = 0
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
            arrBplaSqr[indxSqrOrMap].x = 0

            //bpla_DG_onTop.x = 0
            arrBplaSqr[indxSqrOrMap].y = 25
            // bpla_DG_onTop.y = 175
            // xBPLA = 25
            //  yBPLA_8 = 50
            //yBPLA_DG_onTop = 175
            yBPLA_DG_onBot = 25
            break
        case 3:
            arrBpla_8[indxSqrOrMap].x = 175
            arrBpla_8[indxSqrOrMap].y = 175
            indxTurn = 1
            xBPLA = 150
            yBPLA_8 = 175
            nmbrSqr_8 = 14
            prmtrVector = 2
            cntrTurn = 0
            break
        }
        //rprtr.itemAt(randObjOne).color = "#b83c3c"
        tmr.restart()
    }
}
