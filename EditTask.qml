import QtQuick
import QtQuick.Controls

Page {
    id: editTask
    anchors.fill: parent

    header: CommonBar {
        id: comBar

        titleText: qsTr("Edit Task")
        previousPageTitle: qsTr("Home")
        acceptButton.visible: false
    }


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
                    enabled: !calendar.visible
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
                    placeholderText: "MM/dd/yyyy"
                    placeholderTextColor: Theme.secondaryColor
                    text: calendar.validSelectedDate.getTime() === new Date(0).getTime() ? "" : calendar.validSelectedDate.toLocaleDateString(Qt.locale("en_US"), Locale.ShortFormat)
                    color: Theme.foregroundColor
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    background: Rectangle {
                        color: Theme.backgroundColor
                        border.color: Theme.secondaryColor
                        radius: Theme.radius
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            calendar.visible = true
                        }
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
                    enabled: !calendar.visible
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
                    enabled: !calendar.visible
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
                enabled: !calendar.visible
            }
        }

        Rectangle {
            id: fog
            anchors.fill: parent
            visible: calendar.visible
            color: Theme.secondaryColor
            opacity: 0.8
        }
        CustomCalendar {
            id: calendar
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            y : 20
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


