#include "voiture.h"
#include <QDebug>

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
    setY(getY()+getVitesse());
}

void Voiture::gauche()
{
    setX(getX() - getVitesse());
}

void Voiture::droite()
{
    setX(getX() + getVitesse());
}

void Voiture::recule()
{
    setY(getY() - getVitesse());
}

void Voiture::aleatoire()
{
    int r;
    //qDebug() << regularisation;
    if(regularisation-1 < 0)
    {

        regularisation = real_regu;
        r = rand() % 4;
        d_last_move = r;
    }
    else{
        r = d_last_move;
        regularisation = regularisation - 1;
    }

    switch(r)
    {
    case 0:
        gauche();
        //qDebug("Gauche!");
        break;
    case 1:
        droite();
        //qDebug("Droite!");
        break;
    case 2:
        avance();
        //qDebug("Devant!");
        break;
    case 3:
        recule();
        //qDebug("Derriere!");
        break;
    default:
        break;
    }

    emit vAleatoire();
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
