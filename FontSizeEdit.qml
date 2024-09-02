import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "."

/*
  * @brief The font page allows users to adjust the font size.
*/
Page {
    id: fontPage

    /*
      * @brief Alias for the back button component in the common bar.
    */
    property alias backButton: comBar.backButton

    padding: 12

    /*
      * @brief Header bar for the page, displaying the title and back button.
    */
    header: CommonBar {
        id: comBar

        titleText: qsTr("Font Size")
        previousPageTitle: qsTr("Settings")
        acceptButton.visible: false
    }

    /*
      * @brief Layout containing the font size slider and labels.
    */
    RowLayout {
        id: sliderRow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: parent.topPadding
        spacing: 12

        /*
          * @brief Label displaying the smallest font size.
        */
        Label {
            text: qsTr("A")
            font.pixelSize: 14
            font.weight: 400
            color: Theme.primaryColor
        }

        /*
          * @brief Slider for adjusting the font size.
        */
        Slider {
            id: slider

            Layout.fillWidth: true

            snapMode: Slider.SnapAlways
            stepSize: 1
            from: 14
            value: 15 // Initial font size
            to: 21

            /*
              * @brief Updates the theme's text size as the slider is moved.
            */
            onMoved: Theme.txtSize = value
        }

        /*
          * @brief Label displaying the largest font size.
        */
        Label {
            text: qsTr("A")
            font.pixelSize: 21
            font.weight: 400
            color: Theme.primaryColor
        }
    }

    /*
      * @brief Text element that displays the current font size.
    */
    Text {
        id: txt
        text: Theme.txtSize
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: sliderRow.bottom
        anchors.topMargin: 10
        font.pixelSize: Theme.txtSize
    }

    /*
      * @brief Signal handler for when the back button is clicked.
    */
    backButton.onClicked: StackView.view.pop()
}


