/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
*/

#ifndef QML_ZWEBRAP_PLUGIN_H
#define QML_ZWEBRAP_PLUGIN_H

#include <QQmlExtensionPlugin>
#include <qqml.h>

class QmlZwrClient;
class QmlZwrClientAttached;

#include "QmlZwrClient.h"

class QmlZwebrapPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA (IID "org.qt-project.Qt.QQmlExtensionInterface")
    
public:
    void registerTypes (const char *uri)
    {
        qmlRegisterType<QmlZwrClient> (uri, 1, 0, "QmlZwrClient");
        qmlRegisterType<QmlZwrClientAttached>();
    };
};

#endif

/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
*/