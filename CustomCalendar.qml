import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Rectangle {
    color: Theme.backgroundColor

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
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter

        Row {
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: previousMonth
                source: "qrc:/pictures/previous.png"
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
            }
            Image {
                id: nextMonth
                source: "qrc:/pictures/next.png"
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
                source: "qrc:/pictures/previous.png"
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
            }
            Image {
                id: nextYear
                source: "qrc:/pictures/next.png"
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
                locale: gridCalendar.locale
                Layout.fillWidth: true
            }

            MonthGrid {
                id: gridCalendar

                month: selectedMonth.currentIndex
                year: selectedYear.currentText
                locale: Qt.locale("en_US")
                Layout.fillWidth: true
                delegate: Text {
                    opacity: month === gridCalendar.month ? 1 : 0.2
                    text: day
                    font: gridCalendar.font
                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: -5
                        radius: 25
                        color: validDate ? "blue" : "red"
                        opacity: 0.2
                        visible: selectedDate.getTime() === date.getTime()
                    }
                }

                onClicked: (date) => {
                    selectedDate = date
                    var currentDate = new Date()
                    if((selectedDate.getFullYear() >= currentDate.getFullYear()) && (selectedDate.getMonth() >= currentDate.getMonth()) && (selectedDate.getDate() >= currentDate.getDate())) {
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
                text: "Cancel"
                onClicked: {
                    calendar.visible = false
                }
            }
            Button {
                text: "Ok"
                enabled: validDate
                onClicked: {
                    validSelectedDate = selectedDate
                    calendar.visible = false
                }
            }
        }
    }
}
