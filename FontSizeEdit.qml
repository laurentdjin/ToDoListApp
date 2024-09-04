
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

    Rectangle {
        anchors.fill: parent
        color: Theme.backgroundColor
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
                from: 10
                value: Theme.txtSize  // Initial font size
                to: 21

                /*
              * @brief Updates the theme's text size as the slider is moved.
            */
                onValueChanged: {
                    txt.text = value.toString(); // Update the TextField when slider moves
                    Theme.txtSize = value; // Update Theme.txtSize when slider changes
                }
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
      * @brief TextField for entering the font size.
    */
        TextField {
            id: txt
            text: Theme.txtSize.toString() // Ensure the initial text is a string
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: sliderRow.bottom
            anchors.topMargin: 10
            font.pixelSize: Theme.txtSize
            validator: IntValidator { bottom: 10; top: 21 } // Validator to restrict input

            onTextEdited: {
                inputTimer.restart(); // Restart the timer whenever the text is edited
            }
        }

        Timer {
            id: inputTimer
            interval: 1500 // 500 ms delay to simulate "finished" typing
            repeat: false
            onTriggered: {
                var newValue = parseInt(txt.text);
                if (!isNaN(newValue)) {
                    if (newValue >= slider.from && newValue <= slider.to) {
                        slider.value = newValue;
                        Theme.txtSize = newValue; // Update Theme.txtSize with the new value
                    } else {
                        // Show popup if value is out of range
                        invalidInputPopup.open();
                    }
                }
            }
        }

        /*
      * @brief Standard Popup to notify the user about invalid input.
    */
        Popup {
            id: invalidInputPopup
            width: 280
            height: 120
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape

            // Center the popup in the middle of the page
            x: (fontPage.width - width) / 2
            y: (fontPage.height - height) / 2

            Rectangle {
                anchors.fill: parent
                color: "lightgray" // Change background to light gray
                border.color: "darkgray"
                radius: 10

                Label {
                    text: "Please enter a number between 10 and 21."
                    anchors.centerIn: parent
                    color: "black"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            // Automatically close the popup after a few seconds
            Timer {
                interval: 2000 // 2 seconds
                running: invalidInputPopup.visible
                repeat: false
                onTriggered: invalidInputPopup.close()
            }
        }
    }

    /*
      * @brief Signal handler for when the back button is clicked.
    */
    backButton.onClicked: stackView.pop()
}
