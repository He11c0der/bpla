import QtQuick 2.0

Image {
    property alias srcImg: imgTypeFrameOfIntlgnc.source
    property alias txtImg: txtFrm.text
    id: imgTypeFrameOfIntlgnc
    width: 108
    height: 80

    Text {
        id: txtFrm
        x: 43
        y: 88
        color: "#fdfdfd"

        font.pixelSize: 12
        font.bold: true
        font.family: "Tahoma"
    }
}
