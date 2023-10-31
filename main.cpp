#include "mainwindow.h"

#include <QApplication>
#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "maillage.h"


int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<Maillage>("Try",1,0,"Maillage");
    qmlRegisterType<Maillage>("Try",1,0,"Hexagone");
    //Maillage maillage_carte(10,10);

    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}
