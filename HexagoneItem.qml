import QtQuick 2.15
import Try 1.0

Item {

    property var hexagone: null
    property var wdth: null
    property var hght: null

    Canvas {
        id: canvas
        width: wdth
        height: hght


        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, canvas.width, canvas.height);

            // Dessiner les hexagones
            for (var i = 0; i < 1; ++i) { // Nombre d'hexagones à afficher
                var hexagonPoints = hexagone.getHexagonPoints();
                ctx.beginPath();
                ctx.moveTo(hexagonPoints[0].x, hexagonPoints[0].y);
                for (var j = 1; j < hexagonPoints.length; ++j) {
                    ctx.lineTo(hexagonPoints[j].x, hexagonPoints[j].y);
                }
                ctx.closePath();

                // Remplir en vert si la voiture est présente, sinon transparent
                ctx.fillStyle = hexagone.containsCar ? "green" : "transparent";
                ctx.fill();

                // Bordure noire
                ctx.strokeStyle = "black";
                ctx.lineWidth = 1;
                ctx.stroke();
            }
        }
        Connections {
            target: hexagone
            function onContainsCarChanged() {
                canvas.requestPaint();
            }
        }
    }




}

