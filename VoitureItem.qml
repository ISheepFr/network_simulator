import QtQuick 2.15
import QtQuick.Controls
import Try 1.0

Item {
    property var voiture: null
    //property bool simulationStarted: null

    Voiture{
        x:voiture.x
        y:voiture.y
        vitesse: voiture.vitesse
        puissance: voiture.puissance
    }

    Image {
        id: img
            source: "car-solid.svg"
            width: 10
            height: 10
            x: voiture.x
            y: voiture.y

    }

    Timer {
        interval: 100 // ajuste l'intervalle selon tes besoins (en millisecondes)
        running: simulationStarted
        repeat: true
        onTriggered: {
            elapsedTime = elapsedTime + interval
            voiture.avance()
        }
    }

    Connections {
        target: voiture
        function onXChanged() {
            checkHexagonColor();
            img.x = voiture.x
        }
        function onYChanged() {
            img.y = voiture.y
            checkHexagonColor();
        }
    }

    function checkHexagonColor() {

        for (var i = 0; i < maillage.colonnes; ++i) {
            for( var j =0; j < maillage.lignes; ++j){
                var hexagone = maillage.hexa2d[i][j];
                //console.log("i : " + i + " j : "+ j + "index: "+hexagone.getIndex()+ "nbLignes : "+maillage.lignes + "  nbcolonnes: "+maillage.colonnes);
                if (hexagone.isInHexagone(voiture.x, voiture.y)) {

                    //hexagone.containsCar = !hexagone.containsCar;
                    hexagone.color = voiture.color;
                    var tab_ = maillage.getHexagonesVoisins(i,j,1);
                    console.log(tab_.length);
                    for(var k=0; k<tab_.length; k++)
                    {
                        tab_[k].color = "#505BF518";
                    }
                    //console.log("i : " + i + " j : "+ j + "index: "+hexagone.getIndex());
                    break;
                    }





                //maillage.hexagones[i-1].color = "#505BF518";
                //maillage.hexagones[i+1].color = "#505BF518";

                //maillage.hexagones[i-maillage.lignes].color = "#505BF518";
                //maillage.hexagones[i+1-maillage.lignes].color = "#505BF518";

                //maillage.hexagones[i+maillage.lignes].color = "#505BF518";
                //maillage.hexagones[i+1+maillage.lignes].color = "#505BF518";




            }


    }


}


}
