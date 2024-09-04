/*!
  \file RemoveDone.qml
  \brief The RemoveDone allows users to toggle the option of deleting all completed tasks.
*/

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Page {
    id: themePage

    /*
      * @brief Alias for the back button component in the common bar.
    */
    property alias backButton: comBar.backButton

    /*
      * @brief Background container for the page.
    */
    Rectangle {
        anchors.fill: parent
        color: Theme.backgroundColor

        /*
          * @brief Displays a list of options for theme settings.
        */
        ListView {
            id: otherSettings
            anchors.fill: parent

            /*
              * @brief Model containing the list elements for the settings.
            */
            model: ListModel {
                ListElement { name: qsTr("Remove Done Tasks") }
            }

            /*
              * @brief Delegate that defines how each item in the ListView is displayed.
            */
            delegate: SwitchDelegate {
                id: option
                width: parent.width
                text: model.name
                checked: Theme.lightTheme


                /*!
                    \class Rectangleeeee
                    \brief Signal handler for when the switch is clicked..

                */
                onClicked: {
                    Theme.removeDoneTasks = !Theme.removeDoneTasks; // Toggle the theme
                    console.log("Remove Done--> " + Theme.removeDoneTasks);
                }

                /*!
                    \class Rectangle
                    \brief Ce composant représente un rectangle centré dans la fenêtre.

                */
                contentItem: RowLayout {
                    spacing: 12
                    Layout.fillWidth: true

                    /*!
                        \brief Text label displaying the name of the setting.

                    */
                    Text {
                        text: model.name
                        color: Theme.foregroundColor
                        Layout.alignment: Qt.AlignLeft
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
    }

    /*
      * @brief Header bar for the page.
    */
    header: CommonBar {
        id: comBar

        titleText: qsTr("Remove done")
        previousPageTitle: qsTr("Settings")
        acceptButton.visible: false
    }

    /*
      * @brief Signal handler for when the back button is clicked.
    */
    backButton.onClicked: stackView.pop()
}
