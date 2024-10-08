import QtQuick
import QtQuick.Controls
import "."

ToolBar {

    id: root

    property alias titleText: title.text

    property alias backButton: backButton

    property alias acceptButton: acceptButton

    property alias previousPageTitle: backButton.text

    property alias acceptButtonVisible: acceptButton.visible


    /*
      * @brief Back button for navigating to the previous page.
    */

    ToolButton {
        id: backButton
        anchors.left: parent.left
        anchors.leftMargin: 5
        icon.source: "qrc:pictures/LeftArrow_Icon_Dark.svg"
        text: qsTr("Tasks")
        palette.button: Theme.primaryColor
        palette.buttonText: "black"
        palette.highlight: Theme.lightTheme? "#30DB5B" : "#248A3D"
    }

    /*
      * @brief Title label displayed in the center of the toolbar.
    */
    Label {
        id: title
        text: qsTr("Settings")
        font.pixelSize: Theme.txtSize
        horizontalAlignment: Text.AlignHCenter
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    ToolButton {
        id: acceptButton

        anchors.right: parent.right
        anchors.rightMargin: 5
        visible: false
        icon.source: "qrc:pictures/Check_Icon.svg"
        palette.button: Theme.primaryColor
    }


}
