#include "maillage.h"
#include <QDebug>
#include <iostream>



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
        //d_hexagones.clear();
        d_hexa2d.clear();

        /*for (int i = 0; i < d_colonnes; ++i) {
            for (int j = 0; j < d_lignes; ++j) {
                int ind = d_hexagones.size();
               d_hexagones.push_back(new Hexagone(i,j,ind,this));
            }
        }*/

        for (int i = 0; i < d_colonnes; ++i)
        {
            QList<Hexagone *> colonneHexagones;

            for (int j = 0; j < d_lignes; ++j)
            {
               int index = i*d_lignes+j;
               Hexagone *hexagon = new Hexagone(i, j,index, this);
               colonneHexagones.push_back(hexagon);
            }

            d_hexa2d.push_back(colonneHexagones);
        }




    }
}

QList<QList<Hexagone*>> Maillage::getHexa2d() const
{
    return d_hexa2d;
}


QString Maillage::toString()
{
    QString str = "";
    for(int i = 0; i < d_lignes; i++)
    {
        for(int j = 0; j < d_colonnes; j++)
        {
        str+="("+QString::number(d_hexa2d[i][j]->getX())+","+QString::number(d_hexa2d[i][j]->getY()) + ") ";

        }
        str+="\n";
    }

    qDebug() << str;
    return str;
}

/*QList<Hexagone *> Maillage::getHexagones() const
{
    return d_hexagones;
}*/

QGeoCoordinate Maillage::getCoordinate()
{
    return d_coordinate;
}

QList<Hexagone *> Maillage::getHexagonesVoisins(int i, int j, int profondeur)
{
    QList<Hexagone *> voisins;
    //qDebug() << i << " " << j;

    if (!d_hexa2d[i][j] || profondeur <= 0)
        return voisins;

    if(i >= 0 && i <= d_lignes && j-1 >= 0 && j+1 <= d_colonnes)
    {
        //qDebug() << "(imax, jmax) : " << d_lignes << "," << d_colonnes;
        //qDebug() << "(i,j) : " << i << "," << j ;
        //qDebug() << "(i+1,j+1) : " << i+1 << "," << j+1 ;

        voisins.append(d_hexa2d[i][j-1]);
        voisins.append(d_hexa2d[i][j+1]);

        if(i % 2 == 1)
        {
            voisins.append(d_hexa2d[i-1][j]);
            voisins.append(d_hexa2d[i-1][j+1]);

            if(i+1 < d_lignes)
            {
                voisins.append(d_hexa2d[i+1][j]);
                voisins.append(d_hexa2d[i+1][j+1]);
            }

        }

        else{
            voisins.append(d_hexa2d[i-1][j-1]);
            voisins.append(d_hexa2d[i-1][j]);

            if(i+1 < d_lignes)
            {
                voisins.append(d_hexa2d[i+1][j-1]);
                voisins.append(d_hexa2d[i+1][j]);
            }

        }
        //voisins.append(d_hexa2d[i+1][j]);
    }






  /*  qDebug() << "---------------";
    for(int i=0; i < d_colonnes ; i++)
    {
        for(int j=0; j < d_lignes;j++)
        {
            std::cout << d_hexa2d[i][j]->getIndex() <<" ";
        }
        std::cout << std::endl;
    }
    qDebug() << "-----------";*/

    return voisins;
}





