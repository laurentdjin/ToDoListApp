import QtQuick
import QtQuick.Controls 6.7

Page {
    width: 600
    height: 800

    /**
     @brief Models for today, this week, later task
     */

    ListModel {
        id: todayTaskModel
    }

    ListModel {
        id: thisWeekTaskModel
    }

    ListModel {
        id: laterTaskModel
    }


    header: CommonBar {
        id: comBar

        backButton.visible: false
        titleText: qsTr("Tasks")
        previousPageTitle: qsTr("")
        acceptButton.visible: true
        acceptButton.icon.source: "qrc:/pictures/settings.png"
        acceptButton.onClicked: stackView.push(Qt.resolvedUrl("Settings.qml"))
        acceptButton.background: Rectangle {
            radius: Theme.radius
        }
    }


    Column {
        anchors.fill: parent
        spacing: 10
        padding: 20

        Row {
            spacing: 10


            /*
             * @brief this input allow user to add a new task
             * it will be added on today's task by default
             */
            TextField {
                id: taskInput
                placeholderText: "Add new task"
                focus: true

                Keys.onPressed: (event) => {
                                    if ((event.key === Qt.Key_Enter || event.key === Qt.Key_Return) && taskInput.text !== "") {
                                        todayTaskModel.append({"task": taskInput.text, "completed": false})
                                        taskInput.text = ""
                                    }
                                }
                background: Rectangle {
                    radius: Theme.radius
                }
            }

            /*
             * @brief this button allow user to add a new task
             */
            Button {
                text: "Add task"
                onClicked:
                    if (taskInput.text !== "")
                    {todayTaskModel.append({"task": taskInput.text, "completed": false})
                        taskInput.text = ""}
                background: Rectangle {
                    radius: Theme.radius
                }
            }
        }

        /*
         * @brief Section Today
         */
        Column {
            spacing: 10

            Row {
                width: parent.width
                height: 20
                spacing: 20

                Text {
                    text: "Today"
                    font.pixelSize: 18
                    color: "blue"
                }

                Button {
                    id: toggleButton
                    background: white

                    text: isTodayExpanded ? "▲" : "▼"
                    width: 20
                    height: 20
                    onClicked: {
                        isTodayExpanded = !isTodayExpanded
                    }
                }
            }

            ListView {
                id: todayListView
                width: parent.width
                height: isTodayExpanded ? 150 : 0
                model: todayTaskModel
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


            /*
             * @brief Section This Week
             */
            Column {
                spacing: 14

                Row {
                    height: 20
                    spacing: 20

                    Text {
                        text: "This Week"
                        font.pixelSize: 18
                        color: "green"
                    }

                    Button {
                        id: toggleButton2
                        background: white

                        text: isThisWeekExpanded ? "▲" : "▼"
                        width: 20
                        height: 20
                        onClicked: {
                            isThisWeekExpanded = !isThisWeekExpanded
                        }
                    }

                }

                ListView {
                    id: thisWeekListView
                    width: parent.width
                    height: isThisWeekExpanded ? 150 : 0
                    model: thisWeekTaskModel
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
            }

            /*
             * @brief Section Later
             */
            Column {
                spacing: 14


                Row {
                    height: 20
                    spacing: 20


                    Text {
                        text: "Later"
                        font.pixelSize: 18
                        color: "red"
                    }


                    Button {
                        id: toggleButton3
                        background: white

                        text: isLaterExpanded ? "▲" : "▼"
                        width: 20
                        height: 20
                        onClicked: {
                            isLaterExpanded = !isLaterExpanded
                        }
                    }

                }

                ListView {
                    id: laterListView
                    width: parent.width
                    height: isLaterExpanded ? 150 : 0
                    model: laterTaskModel
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
            }
        }
    }

    property bool isTodayExpanded: true
    property bool isThisWeekExpanded: true
    property bool isLaterExpanded: true

    /*
     * @brief Button to access on EditionPage
     */
    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        icon.source: "qrc:/pictures/add.png"
        width: 40
        height: 40
        onClicked: stackView.push(Qt.resolvedUrl("EditTask.qml"))
        background: Rectangle {
            radius: Theme.radius
        }
    }
}
