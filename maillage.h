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
    Q_PROPERTY(QList<Hexagone*> hexagones READ getHexagones CONSTANT)

public:
    explicit Maillage(QObject *parent = nullptr);
    //QVector<QVector<Hexagone *>> getHexagones() const;
    QList<Hexagone*> getHexagones() const;

    Q_INVOKABLE QString toString();

    int getLignes();
    int getColonnes();

    void setLignes(int lignes);
    void setColonnes(int colonnes);

    void init_hexa();

signals:
    void l_change();
    void c_change();

private:
    QList<Hexagone *> d_hexagones;
    int d_lignes = 0;
    int d_colonnes = 0;

    bool lignes_c = false;
    bool colonnes_c = false;

};

#endif // MAILLAGE_H
