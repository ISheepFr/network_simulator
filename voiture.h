#ifndef VOITURE_H
#define VOITURE_H

#include <QObject>

class Voiture : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double x READ getX WRITE setX NOTIFY xChanged FINAL)
    Q_PROPERTY(double y READ getY WRITE setY NOTIFY yChanged FINAL)
    Q_PROPERTY(int vitesse READ getVitesse WRITE setVitesse NOTIFY vitesseChanged FINAL)

public:
    explicit Voiture(QObject *parent = nullptr);

    double getX();
    double getY();
    double getVitesse();

    Q_INVOKABLE void avance();
   // void recule();
   // void gauche();
   // void droite();

    void setX(double x);
    void setY(double y);
    void setVitesse(int vitesse);

    Q_INVOKABLE QString toString();

signals:
    void xChanged();
    void yChanged();
    void vitesseChanged();
    void vAvance();

private:
    double d_x;
    double d_y;

    int d_vitesse;

};

#endif // VOITURE_H
