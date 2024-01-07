import QtQuick 2.15
import QtQuick.Controls
import Try 1.0

Item{
    property var hexagone: null
    property var wdth: null
    property var hght: null
    property var color_hex: null
    property real zoomOriginal: 14.0

   width: 20
   height: 20



Canvas {
    id: c
    width: wdth
    height: hght



    onPaint: {

        var ctx = getContext("2d");
        ctx.clearRect(0, 0, width, height);

        // Dessiner l'hexagone actuel
        var hexagonPoints = hexagone.getHexagonPoints();
        ctx.beginPath();
        //ctx.moveTo(hexagonPoints[0].x, hexagonPoints[0].y);
        ctx.moveTo(hexagonPoints[0].x / (zoomOriginal - mapOverlay.zoomLevel + 1) , hexagonPoints[0].y / (zoomOriginal - mapOverlay.zoomLevel + 1));
        for (var j = 1; j < hexagonPoints.length; ++j) {
            //ctx.lineTo(hexagonPoints[j].x, hexagonPoints[j].y);
            ctx.lineTo(hexagonPoints[j].x / (zoomOriginal - mapOverlay.zoomLevel + 1), hexagonPoints[j].y / (zoomOriginal - mapOverlay.zoomLevel + 1));
        }
        ctx.closePath();

        // Remplir en vert si la voiture est présente, sinon transparent
        //ctx.fillStyle = hexagone.containsCar ? "green" : "transparent";
        //ctx.fillStyle = hexagone.containsCar ? "#505BF518" : "transparent";

        ctx.fillStyle = hexagone.color
        //ctx.fillStyle = hexagone.containsCar ? "green" : "transparent";

        ctx.fill();

        // Bordure noire
        ctx.strokeStyle = "black";
        ctx.lineWidth = 1;
        ctx.stroke();

    }

    // Reste du code inchangé
    Connections {
        target: hexagone
        function onContainsCarChanged() {
            c.requestPaint();

        }
        function onColorChanged(){
            c.requestPaint();
        }
    }

    Connections{
        target: mapOverlay
        function onZoomLevelChanged(){
            c.requestPaint();
            //console.log(mapOverlay.zoomLevel);
        }
    }





   /* MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(index);
            hexagone.containsCar = !hexagone.containsCar;
            c.requestPaint();
        }
    }*/

}


}
