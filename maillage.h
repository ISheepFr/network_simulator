#ifndef MAILLAGE_H
#define MAILLAGE_H

#include <QObject>
#include <QList>
#include "hexagone.h"

class Maillage : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int lignes READ getLignes WRITE setLignes)
    Q_PROPERTY(int colonnes READ getColonnes WRITE setColonnes)
   // Q_PROPERTY(QVector<QVector<Hexagone *>> hexagones READ getHexagones CONSTANT)
   // Q_PROPERTY(QList<Hexagone*> hexagones READ getHexagones CONSTANT)
    Q_PROPERTY(QList<QList<Hexagone*>> hexa2d READ getHexa2d CONSTANT)

public:
    explicit Maillage(QObject *parent = nullptr);
    //QVector<QVector<Hexagone *>> getHexagones() const;
    QList<Hexagone*> getHexagones() const;
    QList<QList<Hexagone*>> getHexa2d() const;

    Q_INVOKABLE QString toString();

    int getLignes();
    int getColonnes();

    void setLignes(int lignes);
    void setColonnes(int colonnes);

    void init_hexa();

    Q_INVOKABLE QList<Hexagone *> getHexagonesVoisins(int i, int j, int profondeur);



    void ajouterVoisin(QList<Hexagone *> &voisins, int ligne, int colonne);
    bool estDansLesLimites(int ligne, int colonne);

signals:
    void l_change();
    void c_change();

private:
    //QList<Hexagone *> d_hexagones;
    QList<QList<Hexagone*>> d_hexa2d;
    int d_lignes = 0;
    int d_colonnes = 0;

    bool lignes_c = false;
    bool colonnes_c = false;

};

#endif // MAILLAGE_H
