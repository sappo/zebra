################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
TEMPLATE=lib
CONFIG += qt dll qzwebrap-buildlib
mac:CONFIG += absolute_library_soname
win32|mac:!wince*:!win32-msvc:!macx-xcode:CONFIG += debug_and_release build_all
include(../src/qzwebrap.pri)
    TARGET = $$QZWEBRAP_LIBNAME
    DESTDIR = $$QZWEBRAP_LIBDIR
    win32 {
            DLLDESTDIR = $$[QT_INSTALL_BINS]
                QMAKE_DISTCLEAN += $$[QT_INSTALL_BINS]\$${QZWEBRAP_LIBNAME}.dll
    }
target.path = $$DESTDIR
INSTALLS += target
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
