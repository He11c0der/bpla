import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    property alias rptr: rptr
    id: name
    width: 446
    height: 449
    property alias rctnglBPLA_8: rctnglBPLA_8
    property alias rctnglBPLA_onBot_doubleGals: rctnglBPLA_onBot_doubleGals
    //property alias rctnglBPLA_onTop_doubleGals: rctnglBPLA_onTop_doubleGals
    property alias prllAnmtnDoubleGals: prllAnmtnDoubleGals
    property alias xAnmtn: xAnmtn
    property alias yAnmtn: yAnmtn
    Grid {

        id: grid
        x: 0
        y: 0
        width: 446
        height: 449
        rows: 6
        columns: 6
        Repeater {
            id: rptr
            model: grid.rows * grid.columns

            ItmSquare {
                id: itmSquareDlgt
                width: 75
                height: 75
                Text {
                    id: txt
                    text: index
                    anchors.centerIn: parent
                }
            }
        }
    }

    //    Rectangle {
    //        id: rctnglBPLA_onTop_doubleGals
    //        x: 0
    //        y: 175
    //        width: 25
    //        height: 25
    //        color: "#0d0909"
    //        visible: false
    //        radius: 14
    //    }
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
        id: image
        anchors.fill: parent
        source: "qrc:/image/image/imgMap/imgMap.png"
        anchors.leftMargin: -19
        anchors.topMargin: -13
        anchors.bottomMargin: -12
        anchors.rightMargin: -14
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: rctnglBPLA_8
        x: 0
        y: 25
        width: 25
        visible: false
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
    D{i:0;formeditorZoom:1.66}D{i:8}
}
##^##*/

