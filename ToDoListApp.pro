QT += quick

SOURCES += \
        main.cpp

resources.files = main.qml Theme.qml Settings.qml OptionsTheme.qml
resources.prefix = /$${TARGET}
RESOURCES += resources \
    ressources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    OptionsTheme.qml \
    Settings.qml \
    images/Font_Size_Icon.svg \
    images/Remove_Done_Icon.svg \
    images/Tasks_Icon.svg \
    images/Theme_Icon.svg
