/*! \file Page1.qml
    \brief A Documented file.

    Here is a brief description of the file contents
*/
import QtQuick
import QtQuick.Controls 6.7
import QtQuick.Dialogs 6.7

Page {

    id: pageid
    background: Rectangle {
        id: rect
        color: Theme.backgroundColor
    }
    /**
      *@brief function add a new task
      */

    function addTask() {
        if (taskInput.text !== "" && Theme.maxTasksNumber > todayTaskModel.count) {
            let currentDate = new Date().toLocaleDateString(Qt.locale("en_US"), Locale.LongFormat)
            todayTaskModel.append({"task": taskInput.text, "completed": false, "date": currentDate})
            taskInput.text = ""
        }
    }


   /**
    *@brief Models for pop up when the task reach the limit
    */

    MessageDialog {
        id: messageDialog
    }

    /**
      *@brief Models for today, this week, later task
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

    /**
      *@brief CommonBar used on the MainPage
      */

    header: CommonBar {
        id: comBar

        backButton.visible: false
        titleText: qsTr("Tasks")
        previousPageTitle: qsTr("")
        acceptButton.visible: true
        acceptButton.icon.source: "qrc:/pictures/settings.png"
        acceptButton.onClicked: stackView.push(Qt.resolvedUrl("Settings.qml"))
        // acceptButton.background: Rectangle {
        //     radius: Theme.radius
        // }
        acceptButton.width: 26
        acceptButton.height: 26
    }

    Column {
        anchors.fill: parent
        spacing: 10
        padding: 20

        Row {
            spacing: 10

            /**
             * @brief this input allow user to add a new task
             * it will be added on today's task by default
             */
            TextField {
                id: taskInput
                placeholderText: "Add new task"
                focus: true
                font.pixelSize: Theme.txtSize
                width: mainid.width - 150
                maximumLength: 40
                Keys.onPressed: (event) => {
                                    if ((event.key === Qt.Key_Enter || event.key === Qt.Key_Return) && taskInput.text !== "") {
                                        addTask()
                                    }
                                    else if (Theme.maxTasksNumber <= todayTaskModel.count) {
                                        messageDialog.title = "Warning"
                                        messageDialog.text = "Max number of task achieved!"
                                        messageDialog.open()}
                                }
                background: Rectangle {
                    radius: Theme.radius
                }
            }

            /**
             * @brief this button allow user to add a new task
             */
            Button {
                text: "Add task"
                font.pixelSize: Theme.txtSize
                onClicked: addTask()
                background: Rectangle {
                    radius: Theme.radius
                }
            }
        }

        /**
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
                    font.pixelSize: Theme.txtSize
                    color: Theme.todayColor
                }

                /**
                 * @brief counting the number of task in today's section
                 */
                Text {
                    text: todayTaskModel.count
                    font.pixelSize: Theme.txtSize
                    color: Theme.todayColor
                }

                Button {
                    id: toggleButton
                    background: Rectangle{color:Theme.backgroundColor}
                    contentItem: Text {
                        color: Theme.foregroundColor
                        text: isTodayExpanded ? "▲" : "▼"
                    }
                    width: 20
                    height: 20
                    onClicked: {
                        isTodayExpanded = !isTodayExpanded
                    }
                }

                /**
                 * @brief Shows current date, in US format
                 */

                Text {
                    text: new Date().toLocaleDateString(Qt.locale("en_US"), Locale.LongFormat)
                    font.pixelSize: Theme.txtSize
                    color: Theme.foregroundColor
                }
            }

            ListView {
                id: todayListView
                width: pageid.width
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
                            font.pixelSize: Theme.txtSize
                            color: model.completed ? "gray" : "black"
                            opacity: model.completed ? 0.5 : 1.0

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: { parent.opacity = 0.7}
                                onExited: { parent.opacity = 1.0}
                                onClicked: {stackView.push(Qt.resolvedUrl("EditTask.qml"))}
                            }
                        }

                        // Text {
                        //     text: todayListView.currentIndex
                        //     font.pixelSize: Theme.txtSize
                        // }


                    }
                }
                clip: true
            }

            /**
             * @brief Section This Week
             */
            Column {
                spacing: 14

                Row {
                    height: 20
                    spacing: 20

                    Text {
                        text: "This Week"
                        font.pixelSize: Theme.txtSize
                        color: Theme.thisWeekColor
                    }

                    /**
                     * @brief counting the number of task in this week section
                     */
                    Text {
                        text: thisWeekTaskModel.count
                        font.pixelSize: Theme.txtSize
                        color: Theme.thisWeekColor
                    }

                    Button {
                        id: toggleButton2
                        background: Rectangle{color:Theme.backgroundColor}
                        contentItem: Text {
                            color: Theme.foregroundColor
                            text: isThisWeekExpanded ? "▲" : "▼"
                        }
                        width: 20
                        height: 20
                        onClicked: {
                            isThisWeekExpanded = !isThisWeekExpanded
                        }
                    }
                }

                ListView {
                    id: thisWeekListView
                    width: pageid.width
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
                                font.pixelSize: Theme.txtSize
                                color: model.completed ? "gray" : "black"
                                opacity: model.completed ? 0.5 : 1.0
                            }
                            Text {
                                text: model.date
                                font.pixelSize: Theme.txtSize
                                color: "gray"
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: { parent.opacity = 0.7}
                            onExited: { parent.opacity = 1.0}
                            onClicked: {stackView.push(Qt.resolvedUrl("EditTask.qml"))}
                        }
                    }
                    clip: true
                }
            }

            /**
             * @brief Section Later
             */
            Column {
                spacing: 14

                Row {
                    height: 20
                    spacing: 20

                    Text {
                        text: "Later"
                        font.pixelSize: Theme.txtSize
                        color: Theme.laterColor
                    }

                    /**
                     * @brief counting the number of task in later section
                     */
                    Text {
                        text: laterTaskModel.count
                        font.pixelSize: Theme.txtSize
                        color: Theme.laterColor
                    }

                    Button {
                        id: toggleButton3
                        background: Rectangle{color:Theme.backgroundColor}
                        contentItem: Text {
                            color: Theme.foregroundColor
                            text: isLaterExpanded ? "▲" : "▼"
                        }
                        width: 20
                        height: 20
                        onClicked: {
                            isLaterExpanded = !isLaterExpanded
                        }
                    }
                }

                ListView {
                    id: laterListView
                    width: pageid.width
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
                                font.pixelSize: Theme.txtSize
                                color: model.completed ? "gray" : "black"
                                opacity: model.completed ? 0.5 : 1.0
                            }

                            Text {
                                text: model.date
                                font.pixelSize: Theme.txtSize
                                color: "gray"
                            }

                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: { parent.opacity = 0.7}
                            onExited: { parent.opacity = 1.0}
                            onClicked: {stackView.push(Qt.resolvedUrl("EditTask.qml"))}
                        }
                    }
                    clip: true
                }
            }
        }
    }

    /**
     * @brief bool allowing user to expand or not the listview
     */
    property bool isTodayExpanded: true
    property bool isThisWeekExpanded: true
    property bool isLaterExpanded: true

    /**
     * @brief Button to access on EditionPage
     */
    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        icon.source: "qrc:/pictures/add.png"
        width: 26
        height: 26
        onClicked: stackView.push(Qt.resolvedUrl("EditTask.qml"))
        background: Rectangle {
            radius: Theme.radius
        }
    }
}
