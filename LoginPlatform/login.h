#ifndef HANDLETEXTFIELD_H
#define HANDLETEXTFIELD_H

#include <QObject>
#include <QDebug>

class Login : public QObject
{
    Q_OBJECT
public:
    explicit Login(QObject *parent = 0);

signals:
    void setTextAuthentication(QVariant text);

public slots:
    void handleSubmitTextAuthentication(const QString& in);

};

#endif // HANDLETEXTFIELD_H
