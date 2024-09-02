import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7
import QtQuick.Controls.Universal
import QtQuick.Controls.Material
import "."

ApplicationWindow  {
    visible: true

    width: 600
    height: 800
    title: "To-Do List App"

    /*
     * @brief Using a fixed Width and Height
     */

    minimumWidth: 600
    maximumWidth: 600
    minimumHeight: 800
    maximumHeight: 800


    /*
     * @brief Initialising the MainPage and add some transition
     */


    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: MainPage {}

        // Transitions personnalisées (optionnelles)
        pushEnter: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 200 }
        }
        popExit: Transition {
            NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 200 }
        }
    }
}
