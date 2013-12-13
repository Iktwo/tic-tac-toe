QT += quick

SOURCES += \
    src/main.cpp

OTHER_FILES += \
    qml/main.qml \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

RESOURCES += \
    resources.qrc
