/*
  * @brief The ThemeSwitcherPage allows users to toggle between light and dark themes.
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

        titleText: qsTr("Theme")
        previousPageTitle: qsTr("Settings")
        acceptButton.visible: false
    }

    /*
      * @brief Signal handler for when the back button is clicked.
    */
    backButton.onClicked: stackView.pop()
}
