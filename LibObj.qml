import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12

Item {
    property var txtLibAcoustic: ["Машина (Акустика)", "Танк(Акустика)", "Электростанция(Акустика)"]
    property var txtLibTplvsn: ["Машина (Тепловизор)", "Танк(Тепловизор)", "Электростанция(Тепловизор)"]
    property var urlImgAcoustic: ["qrc:/image/image/imgObjAcstc/carAcstc.jpg", "qrc:/image/image/imgObjAcstc/tankAcstc.jpg", "qrc:/image/image/imgObjAcstc/elStnAcstc.jpg"]
    property var urlImgTplvsn: ["qrc:/image/image/imgObjTplvsn/carTplvsn.jpg", "qrc:/image/image/imgObjTplvsn/tankTplvsn.jpg", "qrc:/image/image/imgObjTplvsn/elStnTplvsn.jpg"]
    property int cntrSwpLib: 0
    property int imgWidth: 175
    property int imgHeight: 110
    width: 740
    height: 680
    Frame {
        id: frame
        x: 440
        y: 0
        width: 300
        height: 680

        Column {
            id: column
            x: -12
            y: 20
            width: 294
            height: 648
        }

        Rectangle {
            id: rctnglAcstc
            x: 34
            y: 78
            width: 101
            height: 81
            color: "#d7d5d5"
            radius: 4
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
            border.color: "#484747"
            anchors.horizontalCenterOffset: -2
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: imgAcstc
                x: 8
                y: 8
                width: 85
                height: 65
                source: "qrc:/image/image/imgTypeIntlgnc/imgAcstc.png"
                fillMode: Image.PreserveAspectFit
            }

            Label {
                id: lblAcstc
                x: -18
                y: 79
                color: "#ffffff"
                text: qsTr(" Акустический портрет")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 9
                font.bold: true
                font.family: "Tahoma"
            }

            MouseArea {
                id: msaAcstc
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: {
                    imgAcstc.opacity = 0.8
                }
                onClicked: {
                    lMdlLib.clear()
                    cntrSwpLib = 0

                    onPageType()
                    conf()
                }
                onPressed: {
                    imgAcstc.opacity = 0.5
                }
                onReleased: {
                    imgAcstc.opacity = 1
                }
                onExited: {
                    imgAcstc.opacity = 1
                }
            }
        }

        Rectangle {
            id: rctnglTplvsn
            x: 34
            y: 288
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
            anchors.horizontalCenterOffset: -2
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: imgTplvsn
                x: 8
                y: 8
                width: 85
                height: 65
                source: "qrc:/image/image/imgTypeIntlgnc/imgTplvsn.png"
                fillMode: Image.PreserveAspectFit
            }

            Label {
                id: lblTplvsn
                x: -18
                y: 79
                color: "#ffffff"
                text: qsTr("Тепловизионный портрет")
                font.family: "Tahoma"
                font.bold: true
                font.pointSize: 9
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                id: msaTplvsn
                anchors.fill: parent
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: {
                    imgTplvsn.opacity = 0.8
                }
                onClicked: {
                    lMdlLib.clear()
                    cntrSwpLib = 1

                    onPageType()
                    conf()
                }
                onPressed: {
                    imgTplvsn.opacity = 0.5
                }
                onReleased: {
                    imgTplvsn.opacity = 1
                }
                onExited: {
                    imgTplvsn.opacity = 1
                }
            }
        }

        Rectangle {
            id: rctngRed

            x: 34
            y: 501
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
            anchors.horizontalCenterOffset: -2
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: imgRed
                x: 8
                y: 8
                width: 85
                height: 65
                source: "qrc:/image/image/imgTypeIntlgnc/imgRed.png"
                fillMode: Image.PreserveAspectFit
            }

            Label {
                id: lblRed
                x: -18
                y: 79
                color: "#ffffff"
                text: qsTr("Инфракрасный портрет")
                font.family: "Tahoma"
                font.pointSize: 9
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                id: msaRed
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                enabled: false
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: {
                    imgRed.opacity = 0.8
                }
                onClicked: {
                    lMdlLib.clear()
                    cntrSwpLib = 2
                    onPageType()
                    conf()
                }
                onPressed: {
                    imgRed.opacity = 0.5
                }
                onReleased: {
                    imgRed.opacity = 1
                }
                onExited: {
                    imgRed.opacity = 1
                }
            }
        }
    }

    Frame {
        id: frame1
        x: 440
        y: 0
        width: 300
        height: 33
        Label {
            id: label
            x: 37
            y: -10
            color: "#ffffff"
            text: qsTr("Виды разведки")
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.pointSize: 10
        }
    }

    Frame {
        id: frame2
        x: 8
        y: 31
        width: 432
        height: 649

        Column {
            id: clmnCmpnt
            x: 105
            y: 0
            width: 198
            height: 637

            // anchors.fill: swipeView
            spacing: 60

            //                Loader {
            //                    active: SwipeView.isCurrentItem || SwipeView.isNextItem
            //                            || SwipeView.isPreviousItem
            //                    sourceComponent:
            Image {
                id: imgDlgtCar
                width: imgWidth
                height: imgHeight
                anchors.top: parent.top
                anchors.topMargin: 30
                //source: lMdlLib.get(0).img
                anchors.horizontalCenter: parent.horizontalCenter
                // anchors.centerIn: column
                Text {
                    id: txtDlgtCar
                    //text: lMdlLib.get(0).txt
                    //anchors.centerIn: parent
                    color: "yellow"
                    anchors.bottom: parent.bottom

                    anchors.bottomMargin: -15
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            //                    sourceComponent:
            Image {
                id: imgDlgtTank
                width: imgWidth
                height: imgHeight
                anchors.top: imgDlgtCar.bottom
                source: lMdlLib.get(1).img
                anchors.topMargin: 102
                anchors.horizontalCenter: parent.horizontalCenter
                // anchors.centerIn: column
                Text {
                    id: txtDlgtTank
                    text: lMdlLib.get(1).txt
                    //anchors.centerIn: parent
                    color: "yellow"
                    anchors.bottom: parent.bottom

                    anchors.bottomMargin: -15
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            //                    sourceComponent:
            Image {
                id: imgDlgtelStation
                width: imgWidth
                height: imgHeight
                anchors.top: imgDlgtTank.bottom
                source: lMdlLib.get(2).img
                anchors.topMargin: 100
                anchors.horizontalCenter: parent.horizontalCenter
                // anchors.centerIn: column
                Text {
                    id: txtDlgtelStation
                    text: lMdlLib.get(2).txt
                    //anchors.centerIn: parent
                    color: "yellow"
                    anchors.bottom: parent.bottom

                    anchors.bottomMargin: -15
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    Label {
        id: label2
        x: 173
        y: 9
        color: "#ffffff"
        text: qsTr("Тип объекта")
        font.bold: true
        font.pointSize: 10
    }

    Frame {
        id: frame3
        x: 8
        y: 0
        width: 432
        height: 33
    }

    function onPageType() {

        switch (cntrSwpLib) {
        case 0:
            for (var i = 0; i < txtLibAcoustic.length; i++) {
                lMdlLib.append({
                                   "txt": txtLibAcoustic[i],
                                   "img": urlImgAcoustic[i]
                               })
                //  imgDlgtCar.source = lMdlLib.get(0)
            }
            break
        case 1:
            for (var i = 0; i < txtLibTplvsn.length; i++) {
                lMdlLib.append({
                                   "txt": txtLibTplvsn[i],
                                   "img": urlImgTplvsn[i]
                               })
            }
            break
        }
    }

    function conf() {
        imgDlgtCar.source = lMdlLib.get(0).img
        txtDlgtCar.text = lMdlLib.get(0).txt
        imgDlgtTank.source = lMdlLib.get(1).img
        imgDlgtelStation.source = lMdlLib.get(2).img
        txtDlgtTank.text = lMdlLib.get(1).txt
        txtDlgtelStation.text = lMdlLib.get(2).txt
    }
    Component.onCompleted: {

        for (var i = 0; i < txtLibAcoustic.length; i++) {
            lMdlLib.append({
                               "txt": txtLibAcoustic[i],
                               "img": urlImgAcoustic[i]
                           })
        }
        imgDlgtCar.source = lMdlLib.get(0).img
        txtDlgtCar.text = lMdlLib.get(0).txt
        imgDlgtTank.source = lMdlLib.get(1).img
        imgDlgtelStation.source = lMdlLib.get(2).img
        txtDlgtTank.text = lMdlLib.get(1).txt
        txtDlgtelStation.text = lMdlLib.get(2).txt
        console.log(lMdlLib.get(0).txt)
    }
}
