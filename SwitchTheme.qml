
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: themePage

    property alias backButton: comBar.backButton
    Rectangle {
        anchors.fill: parent
        color: Theme.backgroundColor

        ListView {
            id: otherSettings
            anchors.fill: parent
            model: ListModel {
                ListElement { name: qsTr("Dark Mode") }
            }

            delegate: SwitchDelegate {
                id: option
                width: parent.width
                text: model.name
                checked: Theme.lightTheme
                onClicked: {
                    Theme.lightTheme = !Theme.lightTheme; // Toggle the theme
                    console.log("lightmode--> " + Theme.lightTheme);
                }

                contentItem: RowLayout {
                    spacing: 12
                    Layout.fillWidth: true

                    Text {
                        text: model.name
                        color: Theme.foregroundColor
                        Layout.alignment: Qt.AlignLeft
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: Theme.txtSize
                    }
                }
            }
        }

    }

    header: CommonBar {
        id: comBar

        titleText: qsTr(" Theme")
        previousPageTitle: qsTr("Settings")
        acceptButton.visible: false
    }
    backButton.onClicked: themePage.stackView.pop()
}
