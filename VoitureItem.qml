import QtQuick 2.15
import QtQuick.Controls
import Try 1.0

Item {
    property var voiture: null
    //property bool simulationStarted: null

    Voiture {
        x: voiture ? voiture.x : 0
        y: voiture ? voiture.y : 0
        vitesse: voiture ? voiture.vitesse : 0
        puissance: voiture ? voiture.puissance : 0
        color: voiture ? voiture.color : "transparent"
    }

    Image {
        id: img
            source: "car-solid.svg"
            width: 10
            height: 10
            x: voiture.x - width
            y: voiture.y - height

    }

    Timer {
        interval: 100 * facteurAccel// ajuste l'intervalle selon tes besoins (en millisecondes)
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

    Connections{
        target: mapOverlay
        function onZoomLevelChanged(){
            c.requestPaint();
            console.log(mapOverlay.zoomLevel);
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

                    // Convertir la couleur hexadécimale en couleur avec transparence (RGBA)
                    var hexColorString = hexagone.color.toString();
                    var rgbaColor = Qt.rgba(parseInt(hexColorString.substring(1, 3), 16) / 255.0,
                                            parseInt(hexColorString.substring(3, 5), 16) / 255.0,
                                            parseInt(hexColorString.substring(5, 7), 16) / 255.0,
                                            0.3);  // 0.5 représente 50% de transparence

                    for(var k=0; k<tab_.length; k++)
                    {
                        tab_[k].color = rgbaColor;

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
