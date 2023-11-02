import QtQuick 2.15
import QtQuick.Controls
import Try 1.0

Item {
    property var voiture: null

    Voiture{
        x:voiture.x
        y:voiture.y
        vitesse: voiture.vitesse
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
        interval: 10 // ajuste l'intervalle selon tes besoins (en millisecondes)
        running: true
        repeat: true
        onTriggered: {
            voiture.avance()
        }
    }

    Connections {
        target: voiture
        function onXChanged() {
            checkHexagonColor();
            console.log("emited")
            console.log(voiture.toString())
            img.x = voiture.x
            img.y = voiture.y
            console.log(img.x,img.y)
        }
        function onYChanged() {
            img.x = voiture.x
            img.y = voiture.y

            checkHexagonColor();
        }
    }

    function checkHexagonColor() {
        for (var i = 0; i < maillage.hexagones.length; ++i) {
            var hexagone = maillage.hexagones[i];
            if (hexagone.isInHexagone(voiture.x, voiture.y)) {
                hexagone.containsCar = true;
                hexagone.toString();
            }

    }


}

}
