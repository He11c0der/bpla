import QtQuick 2.9
import QtQuick.Controls 2.2




    //property alias drpA: drpA
    //property alias rctnglSquare: rctnglSquare.border.color


    Rectangle {
        //property alias drpA: drpA
            property alias imgSquare: imgSquare.source
        id: rctnglSquare
        width: 75
        height: 75

        color: "#b83c3c"
        radius: 0
        border.color: "#e0dcdc"
        border.width: 2

        Image {
            id: imgSquare
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            //source: "qrc:/qtquickplugin/images/template_image.png"
            anchors.rightMargin: 4
            anchors.leftMargin: 4
            anchors.bottomMargin: 4
            anchors.topMargin: 4
            fillMode: Image.PreserveAspectFit


        }

    }
