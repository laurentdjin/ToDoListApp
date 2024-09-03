import QtQuick
import QtQuick.Controls 6.7

Item {
    id: taskSection
    property string sectionTitle: "Title"
    property color sectionColor: "black"
    property ListModel sectionModel
    property bool isExpanded: true
    property int listHeight: 150

    Column {
        spacing: 10

        Row {
            width: parent.width
            height: 20
            spacing: 20
            Text {
                text: taskSection.sectionTitle
                font.pixelSize: 18
                color: taskSection.sectionColor
            }
            Button {
                text: taskSection.isExpanded ? "▲" : "▼"
                width: 20
                height: 20
                onClicked: taskSection.isExpanded = !taskSection.isExpanded
            }
        }

        ListView {
            width: parent.width
            height: taskSection.isExpanded ? taskSection.listHeight : 0
            model: taskSection.sectionModel
            delegate: Item {
                width: parent.width
                height: 50
                Row {
                    spacing: 10
                    anchors.verticalCenter: parent.verticalCenter
                    CheckBox {
                        checked: model.completed
                        onCheckedChanged: model.completed = checked
                    }
                    Text {
                        text: model.task
                        font.pixelSize: 14
                        color: model.completed ? "gray" : "black"
                        opacity: model.completed ? 0.5 : 1.0
                    }
                }
            }
            clip: true
        }

        // Spacer to ensure sections do not overlap
        Rectangle {
            width: parent.width
            height: 10
            color: "transparent"
        }
    }
}
