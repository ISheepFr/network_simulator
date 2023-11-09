#ifndef HEXAGONE_H
#define HEXAGONE_H

#include <QColor>
#include <QObject>
#include <QPointF>

class Hexagone : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int hexa_x READ getX CONSTANT)
    Q_PROPERTY(int hexa_y READ getY CONSTANT)
    Q_PROPERTY(bool containsCar READ containsCar WRITE setContainsCar NOTIFY containsCarChanged)
    Q_PROPERTY(QColor color READ getColor WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(int index READ getIndex CONSTANT)

public:

    Hexagone(int x, int y, QObject *parent = nullptr);


    Q_INVOKABLE QString toString();

    Q_INVOKABLE int getX() const;
    Q_INVOKABLE int getY() const;
    Q_INVOKABLE QList<QPointF> getHexagonPoints() const;

    Q_INVOKABLE bool isInHexagone(double x, double y);

    bool containsCar() const;
    void setContainsCar(bool containsCar);

    QColor getColor() const;
    void setColor(QColor color);

    Q_INVOKABLE int getIndex(){return index;};

signals:
    void containsCarChanged();
    void colorChanged();

private:
    int d_x;
    int d_y;
    bool d_containsCar;

    int index;

    QList<QPointF> hexagonPoints() const;
    QColor d_color = QColor(0,0,0,0);




};

#endif // HEXAGONE_H
