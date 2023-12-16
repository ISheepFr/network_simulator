#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "maillage.h"
#include "hexagone.h"
#include "voiture.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Maillage>("Try",1,0,"Maillage");
    qmlRegisterType<Hexagone>("Try",1,0,"Hexagone");
    qmlRegisterType<Voiture>("Try",1,0,"Voiture");

    const QUrl url(u"qrc://qml_reseaux_projet/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
