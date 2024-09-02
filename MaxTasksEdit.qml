import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "."

Page {
    id: root

    property alias backButton: comBar.backButton

    topPadding: 12

    header: CommonBar {
        id: comBar

        titleText: qsTr("Max Tasks")
        previousPageTitle: qsTr("Settings")
        acceptButton.visible: false
    }

    ColumnLayout {
        width: parent.width

        Label {
            id: maxTasksText

            color: Theme.primaryColor
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
            text: qsTr("Please choose the Max tasks number.")
            font.pixelSize: Theme.txtSize

            Layout.fillWidth: true
        }

        SpinBox {
            id: maxTasksSpinbox
            editable: true
            from: 5
            value: Theme.maxTasksNumber
            to: 50

            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10

            onValueChanged: Theme.maxTasksNumber = maxTasksSpinbox.value
        }
    }
    backButton.onClicked: StackView.view.pop()
}
