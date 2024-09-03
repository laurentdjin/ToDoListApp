pragma Singleton
import QtQuick

QtObject {
    property bool lightTheme : false
    readonly property color primaryColor: "green"
    // readonly property color backgroundColor : lightTheme ? "ghostwhite" : "dimgrey"
    readonly property color backgroundColor : lightTheme ? "ghostwhite" : "#1e1e1e"
    readonly property color secondaryColor: "dimgrey"
    readonly property color foregroundColor : lightTheme ? "black" : "lightgrey"
    readonly property color todayColor : lightTheme ? "blue" : "dodgerblue"
    readonly property color thisWeekColor : lightTheme ? "green" : "lightgreen"
    readonly property color laterColor : lightTheme ? "red" : "orange"
    readonly property int radius : 10
    readonly property double opacity : lightTheme ? 0.1 : 0.7
    property int txtSize : 16
    property int maxTasksNumber : 10
    property bool removeDoneTasks: false
}
