pragma Singleton
import QtQuick

QtObject {
    property bool lightTheme : true
    readonly property color primaryColor: "green"
    readonly property color backgroundColor : lightTheme ? "ghostwhite" : "dimgrey"
    readonly property color foregroundColor : lightTheme ? "black" : "lightgrey"
    readonly property int radius : 10
    property int txtSize : 16
    property int maxTasksNumber : 10
}
