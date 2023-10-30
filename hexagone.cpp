#include "hexagone.h"
#include <QDebug>
#include <QPointF>

Hexagone::Hexagone(int x, int y, QObject *parent):QObject(parent),d_x{x},d_y{y},d_containsCar(false)
{

}

int Hexagone::getX() const
{
    return d_x;
}
int Hexagone::getY() const
{
    return d_y;
}
bool Hexagone::containsCar() const
{
    return d_containsCar;
}
void Hexagone::setContainsCar(bool containsCar)
{
    if (d_containsCar != containsCar) {
        d_containsCar = containsCar;
        emit containsCarChanged(); // Émission du signal
    }
}

QString Hexagone::toString()
{
    QString str = "";
   // str = "(x:"+QString::number(getX())+", y:"+QString::number(getY())+", got_car:"+QString::number(containsCar())+")\n";
    str = "("+QString::number(getX())+","+QString::number(getY())+")\n";
    qDebug() << str;

    return str;

}

QList<QPointF> Hexagone::getHexagonPoints() const
{
    return hexagonPoints();
}

QList<QPointF> Hexagone::hexagonPoints() const
{
    QList<QPointF> points;
    double size = 20; // Ajustez la taille de vos hexagones au besoin
    double horizontalSpacing = size * 1.5;
    double verticalSpacing = size * sqrt(3);

    for (int i = 0; i < 6; ++i) {
        double angle_rad = i * M_PI / 3.0;
        double x = d_x * horizontalSpacing + size * cos(angle_rad);
        double y = d_y * verticalSpacing + size * sin(angle_rad);

        if (d_x % 2 != 0) {
            y += verticalSpacing / 2;
        }

        points.append(QPointF(x, y));
    }

    return points;
}
