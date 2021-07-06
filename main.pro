TEMPLATE = app
INCLUDEPATH += include/
SOURCES = src/main.cpp src/widget.cpp
HEADERS = include/widget.h
QT = core gui widgets quick quickwidgets printsupport
RESOURCES = main.qrc files.qrc
TARGET = covidCard


OBJECTS_DIR = build
MOC_DIR = build
UI_DIR = build

linux:android {
   QT += androidextras
}

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
