pragma Singleton
import QtQuick

QtObject {
    property bool lightTheme : false
    readonly property color primaryColor: "green"
    readonly property color backgroundColor : lightTheme ? "ghostwhite" : "dimgrey"
    readonly property color foregroundColor : lightTheme ? "black" : "lightgrey"
    readonly property int radius : 10
}
