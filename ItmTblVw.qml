import QtQuick 2.14
import Qt.labs.qmlmodels 1.0


    TableView {
        x: 0
        y: 0
        width: 473
        height: 131
        //  anchors.fill: parent
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        model: TableModel {
            TableModelColumn {
                display: "name"
            }
            TableModelColumn {
                display: "color"
            }

            rows: [{
                    "name": "cat",
                    "color": "black"
                }, {
                    "name": "dog",
                    "color": "brown"
                }, {
                    "name": "bird",
                    "color": "white"
                }]
        }

        delegate: Rectangle {
            implicitWidth: 50
            implicitHeight: 50
            border.width: 1

            Text {
                text: display
                anchors.centerIn: parent
            }
        }
    }


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

