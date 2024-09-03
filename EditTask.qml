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
        backButton.onClicked: stackView.pop()
    }


    Rectangle {
        anchors.fill: parent
        color: Theme.backgroundColor

        Column {
            anchors.fill: parent
            spacing: 15
            topPadding: 15

            Column {
                id: taskTitle
                width: parent.width
                spacing: 2

                Label {
                    text: "Title"
                    font.pixelSize: Theme.txtSize
                    x: 10
                    color: Theme.primaryColor
                }

                TextField {
                    placeholderText: "Task name"
                    font.pixelSize: Theme.txtSize
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
                    maximumLength: 40
                }
            }

            Column {
                id: taskDate
                width: parent.width
                spacing: 2

                Label {
                    text: "Due date"
                    font.pixelSize: Theme.txtSize
                    x: 10
                    color: Theme.primaryColor
                }

                TextField {
                    placeholderText: "MM/dd/yyyy"
                    placeholderTextColor: Theme.secondaryColor
                    text: calendar.validSelectedDate.getTime() === new Date(0).getTime() ? "" : calendar.validSelectedDate.toLocaleDateString(Qt.locale("en_US"), Locale.ShortFormat)
                    font.pixelSize: Theme.txtSize
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
                    font.pixelSize: Theme.txtSize
                    x: 10
                    color: Theme.primaryColor
                }

                Rectangle {
                    height: time.height
                    width: parent.width - 20
                    border.color: Theme.secondaryColor
                    radius: Theme.radius
                    color: Theme.backgroundColor
                    anchors.horizontalCenter: parent.horizontalCenter

                    Row {
                        id: time
                        width: parent.width
                        spacing: 5

                        RadioButton {
                            id: am
                            checked: true
                            text: "AM"
                            font.pixelSize: Theme.txtSize
                            enabled: !calendar.visible
                            indicator: Rectangle {
                                implicitWidth: 13
                                implicitHeight: 13
                                x: am.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 13
                                border.color: Theme.secondaryColor
                                Rectangle {
                                    width: 7
                                    height: 7
                                    x: 3
                                    y: 3
                                    radius: 7
                                    color: Theme.primaryColor
                                    visible: am.checked
                                }
                            }
                            contentItem: Text {
                                text: am.text
                                font: am.font
                                opacity: enabled ? 1.0 : 0.3
                                color: am.checked ? Theme.foregroundColor : Theme.secondaryColor
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: am.indicator.width + am.spacing
                            }
                        }
                        RadioButton {
                            id: pm
                            text: "PM"
                            font.pixelSize: Theme.txtSize
                            enabled: !calendar.visible
                            indicator: Rectangle {
                                implicitWidth: 13
                                implicitHeight: 13
                                x: pm.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 13
                                border.color: Theme.secondaryColor
                                Rectangle {
                                    width: 7
                                    height: 7
                                    x: 3
                                    y: 3
                                    radius: 7
                                    color: Theme.primaryColor
                                    visible: pm.checked
                                }
                            }
                            contentItem: Text {
                                text: pm.text
                                font: pm.font
                                opacity: enabled ? 1.0 : 0.3
                                color: pm.checked ? Theme.foregroundColor : Theme.secondaryColor
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: pm.indicator.width + pm.spacing
                            }
                        }


                        ComboBox {
                            id: selectedHours
                            model: 12
                            width: 50
                            anchors.verticalCenter: parent.verticalCenter
                            enabled: !calendar.visible
                            currentIndex: 0
                            background: Rectangle {
                                color: Theme.backgroundColor
                                border.color: Theme.secondaryColor
                                height: Theme.txtSize + 2
                                anchors.verticalCenter: selectedHours.verticalCenter
                                radius: Theme.radius
                            }
                            contentItem: Text {
                                text: selectedHours.displayText
                                font.pixelSize: Theme.txtSize
                                color: Theme.foregroundColor
                            }
                            delegate: ItemDelegate {
                                id: hour
                                width: selectedHours.width
                                contentItem: Text {
                                    text: modelData
                                    font.pixelSize: Theme.txtSize
                                    color: Theme.foregroundColor
                                }
                                background: Rectangle {
                                    color: hour.highlighted ? Theme.primaryColor : Theme.backgroundColor
                                }
                                highlighted: selectedHours.highlightedIndex === index
                            }
                        }

                        Label {
                            text: ":"
                            font.pixelSize: Theme.txtSize
                            color: Theme.foregroundColor
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        ComboBox {
                            id: selectedminutes
                            model: {
                                let minutes = []
                                for(let i = 0; i < 60; i += 5) {
                                    minutes.push(i)
                                }
                                return minutes
                            }
                            width: 50
                            anchors.verticalCenter: parent.verticalCenter
                            enabled: !calendar.visible
                            currentIndex: 0
                            background: Rectangle {
                                color: Theme.backgroundColor
                                border.color: Theme.secondaryColor
                                height: Theme.txtSize + 2
                                anchors.verticalCenter: selectedminutes.verticalCenter
                                radius: Theme.radius
                            }
                            contentItem: Text {
                                text: selectedminutes.displayText
                                font.pixelSize: Theme.txtSize
                                color: Theme.foregroundColor
                            }
                            delegate: ItemDelegate {
                                id: minute
                                width: selectedminutes.width
                                contentItem: Text {
                                    text: modelData
                                    font.pixelSize: Theme.txtSize
                                    color: Theme.foregroundColor
                                }
                                background: Rectangle {
                                    color: minute.highlighted ? Theme.primaryColor : Theme.backgroundColor
                                }
                                highlighted: selectedminutes.highlightedIndex === index
                            }
                        }
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
                    font.pixelSize: Theme.txtSize
                    x: 10
                    color: Theme.primaryColor
                }

                ScrollView {
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: editTask.height - comBar.height - taskTitle.height - taskDate.height - taskTime.height - addButton.height - 15*6 - notesLabel.height - taskNotes.spacing
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
                    font.pixelSize: Theme.txtSize
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
}


