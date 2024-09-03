import QtQuick
import QtQuick.Controls
import "."

/*
  * @brief A custom ToolBar with a back button, title, and accept button.
*/
ToolBar {
    id: root

    /*
      * @brief The text displayed in the title label.
    */
    property alias titleText: title.text

    /*
      * @brief Alias for the back button component.
    */
    property alias backButton: backButton

    /*
      * @brief Alias for the accept button component.
    */
    property alias acceptButton: acceptButton

    /*
      * @brief The text displayed on the back button.
    */
    property alias previousPageTitle: backButton.text

    /*
      * @brief Controls the visibility of the accept button.
    */
    property alias acceptButtonVisible: acceptButton.visible



    /*
      * @brief Back button for navigating to the previous page.
    */
    ToolButton {
        id: backButton
        anchors.left: parent.left
        anchors.leftMargin: 5
        icon.source: Theme.lightTheme ? "qrc:pictures/LeftArrow_Icon.svg" : "pictures/LeftArrow_Icon_Dark.svg"
        text: qsTr("Tasks")
        palette.button: Theme.primaryColor
        palette.buttonText: Theme.foregroundColor
    }

    /*
      * @brief Title label displayed in the center of the toolbar.
    */
    Label {
        id: title
        text: qsTr("Settings")
        font.pixelSize: Theme.txtSize
        horizontalAlignment: Text.AlignHCenter
        color: Theme.foregroundColor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    /*
      * @brief Accept button for confirming actions, hidden by default.
    */
    ToolButton {
        id: acceptButton

        anchors.right: parent.right
        anchors.rightMargin: 5
        visible: false
        icon.source: "qrc:pictures/Check_Icon.svg"
        palette.button: Theme.primaryColor
    }
}
