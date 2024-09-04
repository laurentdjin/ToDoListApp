import QtQuick 6.7
import QtQuick.Controls 6.7

Page {

    header: CommonBar {
        id: comBar

        titleText: qsTr("Settings")
        previousPageTitle: qsTr("Home")
        acceptButton.visible: false
        backButton.onClicked: stackView.pop(null)
    }

    Rectangle {
        anchors.fill: parent
        color: Theme.backgroundColor
    }

    /**
      * @brief List of all application options
      */
    ListView {
        id: listView
        width: parent.width
        height: parent.height
        /**
          * @brief The list of elements for each item on ListView
          */
        model: ListModel {
            id: list
            ListElement {
                name: qsTr("Theme")
                page: "Theme"
                iconSource: "qrc:/pictures/Theme_Icon.svg"
                textColor: "black"
            }
            ListElement {
                name: qsTr("Remove completed tasks")
                page: "Tasks"
                iconSource: "qrc:/pictures/Remove_Done_Icon.svg"
                textColor: "black"
            }
            ListElement {
                name: qsTr("Maximum number of tasks")
                page: "MaxTasks"
                iconSource: "qrc:/pictures/Tasks_Icon.svg"
                textColor: "black"
            }
            ListElement {
                name: qsTr("Font Size")
                page: "FontSize"
                iconSource: "qrc:/pictures/Font_Size_Icon.svg"
                textColor: "black"
            }
        }

        delegate: ItemDelegate {
            id: settingsItem
            width: parent.width
            hoverEnabled: true

            Text {
                text: model.name
                color: Theme.foregroundColor
                anchors.centerIn: parent
            }

            icon.source: model.iconSource
            icon.color: Theme.foregroundColor

            background: Rectangle {
                id: rect
                color: Theme.backgroundColor

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: { settingsItem.opacity = Theme.opacity}
                    onExited: { settingsItem.opacity = 1.0}
                }
            }


            /**
              * @brief Add arrow on item
              */
            Image {
                source: Theme.lightTheme ? "qrc:/pictures/Right_Arrow_Icon_Dark.svg" : "qrc:/pictures/Right_Arrow_Icon.svg"
                width: 20
                height: 20
                anchors.right: parent.right
                anchors.rightMargin: 10
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
            }

            /**
              * @brief Function to access the various options on the Settings page
              */
            Connections {
                function onClicked() {
                    if (model.page === "Theme") {
                        console.log("Theme")
                        stackView.push(Qt.resolvedUrl("SwitchTheme.qml"))
                    }
                    else if (model.page === "Tasks") {
                        console.log("Tasks")
                        stackView.push(Qt.resolvedUrl("RemoveDone.qml"))
                    }
                    else if (model.page === "MaxTasks") {
                        console.log("MaxTasks")
                        stackView.push(Qt.resolvedUrl("MaxTasksEdit.qml"))
                    } else if (model.page === "FontSize") {
                        console.log("FontSize")
                        stackView.push(Qt.resolvedUrl("FontSizeEdit.qml"))
                    }
                }
            }
        }
    }
}
