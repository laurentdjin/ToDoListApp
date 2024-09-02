import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Controls.Material
import "."

Window {
    id: root

    width: 360
    height: 800
    minimumHeight: 600
    minimumWidth: 270
    visible: true

    StackView {
        id: stackView
        anchors.fill: parent

        //initialItem: SwitchTheme {}
        initialItem: FontSizeEdit {}
        //initialItem: MaxTasksEdit {}
    }
}
