#include "mainwindow.h"
#include "ui_interface.h"


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->quickWidget->setSource(QUrl(QStringLiteral("qrc:/grille.qml")));
    //ui->quickWidget->show();

}

MainWindow::~MainWindow()
{
    delete ui;
}

