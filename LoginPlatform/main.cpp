#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>

#include "login.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    Login handleSubmitTextAuthentication;

    QObject *topLevel = engine.rootObjects().value(0);
    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);

    // connect our QML signal to our C++ slot
    //syntax ...( window,qml signla , &object, slot din object )
    QObject::connect(window, SIGNAL(submitTextAuthentication(QString)),
                         &handleSubmitTextAuthentication, SLOT(handleSubmitTextAuthentication(QString)));

    // connect our C++ signal to our QML slot
    // NOTE: if we want to pass an parameter to our QML slot, it has to be
    // a QVariant.
    //syntax ... ( &obj , signal function java from qml , window, slot din object )
    QObject::connect(&handleSubmitTextAuthentication, SIGNAL(setTextAuthentication(QVariant)),
                         window, SLOT(setTextAuthentication(QVariant)));

    return app.exec();
}
