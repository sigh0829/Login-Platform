#include "login.h"

/*
 * This class handles interactions with the text field
 */
Login::Login(QObject *parent) :
    QObject(parent)
{
}

void Login::handleSubmitTextAuthentication(const QString &in)
{
    qDebug() << "c++: Login::handleSubmitTextField:" << in;
    QString str("dasdas");
    emit setTextAuthentication(in.toUpper()); //send data to qml function
}
