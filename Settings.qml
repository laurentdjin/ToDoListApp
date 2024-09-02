import QtQuick 6.7
import QtQuick.Controls 6.7

Page {

    header: CommonBar {
        id: comBar

        titleText: qsTr("Settings")
        previousPageTitle: qsTr("Home")
        acceptButton.visible: false
    }

    ListView {
        width: parent.width
        height: parent.height

        model: ListModel {
            id: list
            ListElement {
                name: qsTr("Theme")
                page: "Theme"
                iconSource: "qrc:/pictures/Theme_Icon.svg"
                color: ""
            }
            ListElement {
                name: qsTr("Remove completed tasks")
                page: "Tasks"
                iconSource: "qrc:/pictures/Remove_Done_Icon.svg"
            }
            ListElement {
                name: qsTr("Maximum number of tasks")
                page: "MaxTasks"
                iconSource: "qrc:/pictures/Tasks_Icon.svg"
            }
            ListElement {
                name: qsTr("Font Size")
                page: "FontSize"
                iconSource: "qrc:/pictures/Font_Size_Icon.svg"
            }
        }

        delegate: ItemDelegate {
            id: settingsItem
            width: parent.width
            text: model.name
            icon.source: model.iconSource
            icon.color: Theme.foregroundColor
            palette.text: Theme.foregroundColor

            background: Rectangle {
                color: Theme.backgroundColor
            }

            Image {
                source: Theme.lightTheme ? "qrc:/pictures/Right_Arrow_Icon_Dark.svg" : "qrc:/pictures/Right_Arrow_Icon.svg"
                width: 20
                height: 20
                anchors.right: parent.right
                anchors.rightMargin: 10
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
            }

            Connections {
                function onClicked() {
                    if (model.page === "Theme") {
                        console.log("Theme")
                        stackView.push(Qt.resolvedUrl("OptionsTheme.qml"))
                    }
                }
            }
        }
    }
    Button {
        text: "Aller à la MainPage"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
        onClicked: stackView.pop()
    }
}
