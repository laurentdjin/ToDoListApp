QT += quick

SOURCES += \
        main.cpp

resources.files = main.qml Theme.qml Settings.qml MainPage.qml EditTask.qml CommonBar.qml SwitchTheme.qml FontSizeEdit.qml MaxTasksEdit.qml CustomCalendar.qml TaskSection.qml RemoveDone.qml

resources.prefix = /$${TARGET}
RESOURCES += resources \
    resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    TaskSection.qml \
    RemoveDone.qml
