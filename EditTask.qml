import QtQuick
import QtQuick.Controls

Item {
    id: editTask
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: Theme.backgroundColor

        Column {
            anchors.fill: parent
            spacing: 15

            Column {
                id: taskTitle
                width: parent.width
                spacing: 2

                Label {
                    text: "Title"
                    x: 10
                    color: Theme.primaryColor
                }

                TextField {
                    placeholderText: "Task name"
                    placeholderTextColor: Theme.secondaryColor
                    color: Theme.foregroundColor
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        color: Theme.backgroundColor
                        border.color: Theme.secondaryColor
                        radius: Theme.radius
                    }

                }
            }

            Column {
                id: taskDate
                width: parent.width
                spacing: 2

                Label {
                    text: "Due date"
                    x: 10
                    color: Theme.primaryColor
                }

                TextField {
                    placeholderText: "dd/MM/yyyy"
                    placeholderTextColor: Theme.secondaryColor
                    color: Theme.foregroundColor
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        color: Theme.backgroundColor
                        border.color: Theme.secondaryColor
                        radius: Theme.radius
                    }

                }
            }

            Column {
                id: taskTime
                width: parent.width
                spacing: 2

                Label {
                    text: "Due time"
                    x: 10
                    color: Theme.primaryColor
                }

                TextField {
                    placeholderText: "HH:mm"
                    placeholderTextColor: Theme.secondaryColor
                    color: Theme.foregroundColor
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        color: Theme.backgroundColor
                        border.color: Theme.secondaryColor
                        radius: Theme.radius
                    }

                }
            }

            Column {
                id: taskNotes
                width: parent.width
                spacing: 2

                Label {
                    id: notesLabel
                    text: "Notes"
                    x: 10
                    color: Theme.primaryColor
                }

                ScrollView {
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: editTask.height - taskTitle.height - taskDate.height - taskTime.height - addButton.height - 15*5 - notesLabel.height - taskNotes.spacing
                    TextArea {
                        placeholderText: "empty"
                        placeholderTextColor: Theme.secondaryColor
                        color: Theme.foregroundColor
                        background: Rectangle {
                            color: Theme.backgroundColor
                            border.color: Theme.secondaryColor
                            radius: Theme.radius
                        }
                    }
                }
            }

            Button {
                id: addButton
                width: parent.width - 20
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle {
                    color: Theme.secondaryColor
                    radius: Theme.radius
                }
                contentItem: Text {
                    color: Theme.foregroundColor
                    text: "Add task"
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}
