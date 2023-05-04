import QtQuick 2.9
import QtQuick.Controls 2.2

//property alias drpA: drpA
//property alias rctnglSquare: rctnglSquare.border.color
Rectangle {
    //property alias drpA: drpA
     property alias rptrSqr:  rptrSqr
    property alias imgSquare: imgSquare.source
    property alias sqrWidth: imgSquare.width
    property alias sqrHeigth: imgSquare.height
    property alias rctnglBPLA_8_sqr: rctnglBPLA_8
    property alias rctnglBPLA_onBot_doubleGals_sqr: rctnglBPLA_onBot_doubleGals
    //property alias rctnglBPLA_onTop_doubleGals: rctnglBPLA_onTop_doubleGals
    property alias prllAnmtnDoubleGals_sqr: prllAnmtnDoubleGals
    property alias xAnmtn_sqr: xAnmtn
    property alias yAnmtn_sqr: yAnmtn
    id: rctnglSquare
    width: 446
    height: 449

    color: "#b83c3c"
    radius: 0
    border.color: "#e0dcdc"
    border.width: 2

    Image {
        id: imgSquare
        anchors.fill: parent
        // source: "qrc:/image/image/imgMap/imgSquareMap/sqr11.png"
        anchors.bottomMargin: -21
        anchors.leftMargin: -13
        anchors.rightMargin: -25
        anchors.topMargin: -17
        fillMode: Image.PreserveAspectFit
    }

    Grid {
        id: grid
        anchors.fill: parent
        rows: 6
        columns: 6
        Repeater {
            id:rptrSqr
            model: 36
            delegate: Frame {
                id: frame
                width: 75
                height: 75
            }
        }
    }
    ParallelAnimation {
        id: prllAnmtnDoubleGals
        running: false
        PropertyAnimation {
            target: rctnglBPLA_onBot_doubleGals
            property: "x"
            to: xBPLA
            duration: 1000
        }
        //        PropertyAnimation {
        //            target: rctnglBPLA_onTop_doubleGals
        //            property: "x"
        //            to: xBPLA
        //            duration: 1000
        //        }
        PropertyAnimation {
            target: rctnglBPLA_onBot_doubleGals
            property: "y"
            to: yBPLA_DG_onBot
            duration: 1000
        }
        //        PropertyAnimation {
        //            target: rctnglBPLA_onTop_doubleGals
        //            property: "y"
        //            to: yBPLA_DG_onTop
        //            duration: 1000
        //        }
    }

    Image {
        id: rctnglBPLA_8
        x: 0
        y: 25
        width: 25
        visible: true
        source: "qrc:/image/image/imgMap/imgBPLA.png"
        height: 25

        // color: "#0d0909"
        // radius: 14
        PropertyAnimation on x {
            id: xAnmtn
            running: false
            easing.type: Easing.InQuint
            to: xBPLA
            duration: 1000
        }
        PropertyAnimation on y {

            id: yAnmtn

            running: false
            easing.type: Easing.InQuint
            to: yBPLA_8
            duration: 1000
        }
    }
    Image {
        id: rctnglBPLA_onBot_doubleGals
        x: 0
        y: 25
        width: 25
        height: 25
        source: "qrc:/image/image/imgMap/imgBPLA.png"
        visible: false
        //     color: "#0d0909"
        //   radius: 14
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}D{i:1}
}
##^##*/

