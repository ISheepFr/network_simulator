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

public:
    Hexagone(int x, int y, QObject *parent = nullptr);

    Q_INVOKABLE QString toString();

    Q_INVOKABLE int getX() const;
    Q_INVOKABLE int getY() const;
    Q_INVOKABLE QList<QPointF> getHexagonPoints() const;

    bool containsCar() const;
    void setContainsCar(bool containsCar);

signals:
    void containsCarChanged();


private:
    int d_x;
    int d_y;
    bool d_containsCar;
    QList<QPointF> hexagonPoints() const;




};

#endif // HEXAGONE_H
