#include "maillage.h"
#include <QDebug>

Maillage::Maillage(QObject *parent) : QObject(parent)
{

}

int Maillage::getLignes(){ return d_lignes; }
int Maillage::getColonnes(){ return d_colonnes; }

void Maillage::setLignes(int lignes)
{
    if(lignes_c == false)
    {
        d_lignes = lignes;
        lignes_c = true;
        init_hexa();

    }
}
void Maillage::setColonnes(int colonnes)
{
    if(colonnes_c == false)
    {
        d_colonnes = colonnes;
        colonnes_c = true;
        init_hexa();

    }
}

void Maillage::init_hexa()
{
    if( lignes_c == true && colonnes_c == true )
    {
        d_hexagones.clear();


        for (int i = 0; i < d_colonnes; ++i) {
            for (int j = 0; j < d_lignes; ++j) {
               d_hexagones.push_back(new Hexagone(i,j,this));
            }

        }
    }
}


QString Maillage::toString()
{
    QString str = "";
    for(int i = 0; i < d_lignes; i++)
    {
        str+="("+QString::number(d_hexagones[i]->getX())+","+QString::number(d_hexagones[i]->getY()) + ") ";
        str+="\n";
    }


    qDebug() << str;
    return str;
}

QList<Hexagone *> Maillage::getHexagones() const
{
    return d_hexagones;
}


