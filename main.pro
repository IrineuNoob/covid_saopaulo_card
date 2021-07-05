TEMPLATE = app
INCLUDEPATH += include/
SOURCES = src/main.cpp src/widget.cpp
HEADERS = include/widget.h
QT = core gui widgets quick quickwidgets printsupport
RESOURCES = main.qrc files.qrc
TARGET = main


OBJECTS_DIR = build
MOC_DIR = build
UI_DIR = build
