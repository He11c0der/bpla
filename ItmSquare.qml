import QtQuick 2.9
import QtQuick.Controls 2.2

//property alias drpA: drpA
//property alias rctnglSquare: rctnglSquare.border.color
Rectangle {
    //property alias drpA: drpA
    property alias imgSquare: imgSquare.source
    property alias sqrWidth: imgSquare.width
    property alias sqrHeigth: imgSquare.height
    id: rctnglSquare
    width: 75
    height: 75

    color: "#b83c3c"
    radius: 0
    border.color: "#e0dcdc"
    border.width: 2

    Image {
        id: imgSquare
        x: 0
        y: -21
        width: 75
        height: 111
        fillMode: Image.PreserveAspectFit
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:6}
}
##^##*/

