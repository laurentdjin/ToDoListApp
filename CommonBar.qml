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
    ToolButton {
        id: backButton
        anchors.left: parent.left
        anchors.leftMargin: 5
        icon.source: Theme.lightTheme ? "pictures/LeftArrow_Icon_Dark.svg" : "qrc:pictures/LeftArrow_Icon.svg"
        text: qsTr("Tasks")
        palette.button: Theme.primaryColor
        palette.buttonText: Theme.foregroundColor
    }

    Label {
        id: title
        text: qsTr("Settings")
        font.pixelSize: Theme.txtSize
        horizontalAlignment: Text.AlignHCenter
        color: Theme.foregroundColor
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
