import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "."

Page {
    id: root

    property alias backButton: comBar.backButton

    padding: 12
    header: CommonBar {
        id: comBar

        titleText: qsTr(" Font Size")
        previousPageTitle: qsTr("Settings")
        acceptButton.visible: false
    }

    RowLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: parent.topPadding

        spacing: 12

        Label {
            text: qsTr("A")
            font.pixelSize: 14
            font.weight: 400
            color: Theme.primaryColor
        }

        Slider {
            id: slider

            Layout.fillWidth: true

            snapMode: Slider.SnapAlways
            stepSize: 1
            from: 14
            value: 15//Theme.txtSize
            to: 21

            onMoved: Theme.txtSize = value
        }

        Label {
            text: qsTr("A")
            font.pixelSize: 21
            font.weight: 400
            color: Theme.primaryColor
        }
    }

    Text {
        id: txt
        text: Theme.txtSize
        anchors.centerIn: parent
        font.pixelSize: Theme.txtSize
    }

    // Logic for back button functionality
    backButton.onClicked: StackView.view.pop()
}
