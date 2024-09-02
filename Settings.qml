import QtQuick 6.7
import QtQuick.Controls 6.7

Item {
    width: 800
    height: 800

    Rectangle {
        anchors.fill: parent

        Text {
            text: "Settings"
            anchors.centerIn: parent
            font.pixelSize: 30
        }

        Button {
            text: "Aller à la MainPage"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 20
            onClicked: stackView.pop()
        }
    }
}
