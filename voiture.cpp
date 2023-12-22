#include "voiture.h"

Voiture::Voiture(QObject *parent):QObject(parent)
{

}

double Voiture::getX(){return d_x;}
double Voiture::getY(){return d_y;}
double Voiture::getVitesse(){return d_vitesse;}

void Voiture::setX(double x)
{
    if(x != d_x)
    {
      d_x = x;
        emit xChanged();
    }
}
void Voiture::setY(double y)
{
    if(y != d_y)
    {
      d_y = y;
        emit yChanged();
    }

}
void Voiture::setVitesse(int vitesse)
{
    if(vitesse != d_vitesse)
    {
      d_vitesse = vitesse;
        emit vitesseChanged();
    }

}

void Voiture::avance()
{
    setX(getX()+getVitesse());
    emit vAvance();
}

QString Voiture::toString()
{
    return "VOITURE ("+QString::number(d_x)+","+QString::number(d_y)+")";
}

int Voiture::getPuissance()
{
    return d_puissance;
}
void Voiture::setPuissance(int p)
{
    if(p != d_puissance)
    {
        d_puissance = p;
    }
}

QColor Voiture::getColor() const
{
    return d_color;
}

void Voiture::setColor(QColor color)
{
    if(d_color != color)
    {
        d_color = color;
    }
}
