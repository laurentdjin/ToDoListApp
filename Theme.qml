pragma Singleton
import QtQuick

QtObject {
    property bool lightTheme : false
    readonly property color primaryColor: "lightgreen"
    readonly property color backgroundColor : lightTheme ? "ghostwhite" : "dimgrey"
    readonly property color secondaryColor: "dimgrey"
    readonly property color foregroundColor : lightTheme ? "black" : "lightgrey"
    readonly property int radius : 10
    property int txtSize : 16
    property int maxTasksNumber : 10
    property bool removeDoneTasks: false
}
