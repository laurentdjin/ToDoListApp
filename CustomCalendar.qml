import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Rectangle {
    width : content.height
    height : width
    color: Theme.backgroundColor
    radius: Theme.radius

    readonly property int firstYear: 2024
    readonly property int lastYear: 2030

    property date selectedDate: new Date()
    property bool validDate: false
    property date validSelectedDate : new Date(0)

    function fillYear(first, last){
        let years = []
        for(let i = first; i <= last; i++) {
            years.push(i)
        }
        return years
    }

    Column {
        anchors.centerIn: parent
        spacing: 20
        id: content

        Row {
            id: monthYear
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: previousMonth
                source: Theme.lightTheme ? "qrc:/pictures/previous.png" : "qrc:/pictures/previous_dark.png"
                anchors.verticalCenter: parent.verticalCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (selectedMonth.currentIndex > 0) {
                            selectedMonth.currentIndex--
                        }
                    }
                }
            }
            ComboBox {
                id: selectedMonth
                model: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
                currentIndex: 0
                anchors.verticalCenter: parent.verticalCenter
                width : 6 * Theme.txtSize
                background: Rectangle {
                    color: Theme.backgroundColor
                    border.color: Theme.secondaryColor
                    height: Theme.txtSize + 2
                    anchors.verticalCenter: selectedMonth.verticalCenter
                    radius: Theme.radius
                }
                contentItem: Text {
                    text: selectedMonth.displayText
                    font.pixelSize: Theme.txtSize
                    color: Theme.foregroundColor
                }
                delegate: ItemDelegate {
                    id: month
                    width: selectedMonth.width
                    contentItem: Text {
                        text: modelData
                        font.pixelSize: Theme.txtSize
                        color: Theme.foregroundColor
                    }
                    background: Rectangle {
                        color: month.highlighted ? Theme.primaryColor : Theme.backgroundColor
                    }
                    highlighted: selectedMonth.highlightedIndex === index
                }
            }
            Image {
                id: nextMonth
                source: Theme.lightTheme ? "qrc:/pictures/next.png" : "qrc:/pictures/next_dark.png"
                anchors.verticalCenter: parent.verticalCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (selectedMonth.currentIndex < 11)  {
                            selectedMonth.currentIndex++
                        }
                    }
                }
            }

            Image {
                id: previousYear
                source: Theme.lightTheme ? "qrc:/pictures/previous.png" : "qrc:/pictures/previous_dark.png"
                anchors.verticalCenter: parent.verticalCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (selectedYear.currentIndex > 0) {
                            selectedYear.currentIndex--
                        }
                    }
                }
            }
            ComboBox {
                id: selectedYear
                model: fillYear(firstYear, lastYear)
                currentIndex: 0
                width: 3 * Theme.txtSize
                anchors.verticalCenter: parent.verticalCenter
                background: Rectangle {
                    color: Theme.backgroundColor
                    border.color: Theme.secondaryColor
                    height: Theme.txtSize + 2
                    anchors.verticalCenter: selectedYear.verticalCenter
                    radius: Theme.radius
                }
                contentItem: Text {
                    text: selectedYear.displayText
                    font.pixelSize: Theme.txtSize
                    color: Theme.foregroundColor
                }
                delegate: ItemDelegate {
                    id: year
                    width: selectedYear.width
                    contentItem: Text {
                        text: modelData
                        font.pixelSize: Theme.txtSize
                        color: Theme.foregroundColor
                    }
                    background: Rectangle {

                        color: year.highlighted ? Theme.primaryColor : Theme.backgroundColor
                    }
                    highlighted: selectedYear.highlightedIndex === index
                }
            }
            Image {
                id: nextYear
                source: Theme.lightTheme ? "qrc:/pictures/next.png" : "qrc:/pictures/next_dark.png"
                anchors.verticalCenter: parent.verticalCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (selectedYear.currentIndex < lastYear - firstYear) {
                            selectedYear.currentIndex++
                        }
                    }
                }
            }
        }

        ColumnLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            DayOfWeekRow {
                id: days
                locale: gridCalendar.locale
                Layout.fillWidth: true
                delegate: Text {
                    text: model.shortName
                    font.pixelSize: Theme.txtSize
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: Theme.foregroundColor
                }
            }

            MonthGrid {
                id: gridCalendar
                month: selectedMonth.currentIndex
                year: selectedYear.currentText
                locale: Qt.locale("en_US")
                Layout.fillWidth: true
                font.pixelSize: Theme.txtSize
                delegate: Text {
                    opacity: month === gridCalendar.month ? 1 : 0.2
                    text: day
                    font: gridCalendar.font
                    color: Theme.foregroundColor

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: -5
                        radius: 25
                        color: validDate ? Theme.primaryColor : "red"
                        opacity: 0.2
                        visible: selectedDate.getTime() === date.getTime()
                    }
                }

                onClicked: (date) => {
                    selectedDate = date
                    var currentDate = new Date()
                    // calculate the time in milliseconds to remove it from the current date and be able to select the current date in the calendar
                    var timeMilliseconds = currentDate.getHours() * 3600000 + currentDate.getMinutes() * 60000 + currentDate.getMilliseconds()
                    currentDate.setTime(currentDate.getTime() - timeMilliseconds)
                    if (selectedDate.getTime() >= currentDate.getTime()) {
                        validDate = true
                    } else {
                        validDate = false
                    }
                }
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 40
            Button {
                background: Rectangle {
                    color: Theme.backgroundColor
                    border.color: Theme.primaryColor
                    radius: Theme.radius
                }
                contentItem: Text {
                    color: Theme.primaryColor
                    text: "Cancel"
                    font.pixelSize: Theme.txtSize
                    horizontalAlignment: Text.AlignHCenter
                }
                onClicked: {
                    calendar.visible = false
                }
            }
            Button {
                id: okButton
                enabled: validDate
                background: Rectangle {
                    color: Theme.backgroundColor
                    border.color: Theme.primaryColor
                    radius: Theme.radius
                    opacity: okButton.enabled ? 1 : 0.4
                }
                contentItem: Text {
                    color: Theme.primaryColor
                    text: "Ok"
                    font.pixelSize: Theme.txtSize
                    horizontalAlignment: Text.AlignHCenter
                    opacity: okButton.enabled ? 1 : 0.4
                }
                onClicked: {
                    validSelectedDate = selectedDate
                    calendar.visible = false
                }
            }
        }
    }
}
