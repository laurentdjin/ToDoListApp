import QtQuick 6.7
import QtQuick.Controls 6.7

Item {

    ListView {
        width: parent.width
        height: parent.height

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

            // MouseArea {
            //     anchors.fill: parent
            //     hoverEnabled: true
            //     property bool hovered
            //     onEntered: {hovered = true}
            //     onExited: {hovered = false}
            //     onClicked: {myListView.currentIndex = index}
            // }

            Connections {
                function onClicked() {
                    if (model.page === "Theme") {
                        console.log("Theme")
                        stackView.push(Qt.resolvedUrl("SwitchTheme.qml"))
                    } else if (model.page === "Tasks") {
                        console.log("Tasks")
                        stackView.push(Qt.resolvedUrl("RemoveTasks.qml"))
                    } else if (model.page === "MaxTasks") {
                        console.log("MaxTasks")
                        stackView.push(Qt.resolvedUrl("MaxTasksEdit.qml"))
                    } else if (model.page === "FontSize") {
                        console.log("FontSize")
                        stackView.push(Qt.resolvedUrl("FontSizeEdit.qml"))
                    }
                }
            }
        }

        ScrollIndicator.vertical: ScrollIndicator { }
    }

    Button {
        text: "Aller à la MainPage"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
        onClicked: stackView.pop()
    }
}
