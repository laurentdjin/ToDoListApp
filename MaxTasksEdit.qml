import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "."

/*
  * @brief The maxtasks page allows users to set the maximum number of tasks.
*/
Page {
    id: maxtasks

    /*
      * @brief Alias for the back button component in the common bar.
    */
    property alias backButton: comBar.backButton

    topPadding: 12

    /*
      * @brief Header bar for the page, displaying the title and back button.
    */
    header: CommonBar {
        id: comBar

        titleText: qsTr("Max Tasks")
        previousPageTitle: qsTr("Settings")
        acceptButton.visible: false
    }

    /*
      * @brief Layout containing the label and spinbox for setting max tasks.
    */
    ColumnLayout {
        width: parent.width

        /*
          * @brief Label instructing the user to choose the max tasks number.
        */
        Label {
            id: maxTasksText

            color: Theme.primaryColor
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
            text: qsTr("Please choose the Max tasks number.")
            font.pixelSize: Theme.txtSize

            Layout.fillWidth: true
        }

        /*
          * @brief SpinBox for selecting the maximum number of tasks.
        */
        SpinBox {
            id: maxTasksSpinbox
            editable: true
            from: 5
            value: Theme.maxTasksNumber
            to: 50

            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10

            /*
              * @brief Updates the theme's max tasks number as the spinbox value changes.
            */
            onValueChanged: Theme.maxTasksNumber = maxTasksSpinbox.value
        }
    }

    /*
      * @brief Signal handler for when the back button is clicked.
    */
    backButton.onClicked: stackView.pop()

}
