import QtQuick 2.15
import QtLocation
import QtPositioning
import Try 1.0
import QtQuick.Controls 2.15

Rectangle
{

    property double lat: 47.750839
    property double lng: 7.335888

    Plugin
    {
        id: openstreemap
        name:"osm"
        PluginParameter { name: "osm.mapping.providersrepository.address"; value: "https://tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png" }
        //PluginParameter { name: "osm.mapping.providersrepository.address"; value: "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}" }
    }

    Map
    {


        id: mapview
        anchors.fill: parent
        plugin: openstreemap
        WheelHandler {
            id: wheel
            // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
            // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
            // and we don't yet distinguish mice and trackpads on Wayland either
            acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                             ? PointerDevice.Mouse | PointerDevice.TouchPad
                             : PointerDevice.Mouse
            rotationScale: 1/120
            property: "zoomLevel"
        }
        DragHandler {
            id: drag
            target: null
            onTranslationChanged: (delta) => mapview.pan(-delta.x, -delta.y)
        }

        center: QtPositioning.coordinate(lat,lng)
        zoomLevel: 14

        Text{
            id: label
            //text: maillage.toString()
        }

        Maillage {
            id: maillage
            lignes: 5
            colonnes: 10
        }


      /*  Connections{
            target: Maillage
            onL_change: label.text = "l_changed"
            onC_change: label.text = "c_changed"
        }*/

        property bool color: false

        /*Repeater {
            model: maillage.hexagones
            delegate : HexagoneItem {
                hexagone: modelData
                wdth: parent.width
                hght: parent.height
                //x: modelData.hexa_x
                //y: modelData.hexa_y

            }

        }*/

        Repeater {
            model: maillage.hexa2d
            delegate: Repeater {
                model: modelData
                delegate: HexagoneItem {
                    hexagone: modelData
                    wdth: parent.width
                    hght: parent.height
                    // x et y dépendent de la structure de Hexagone, ajuste-les en conséquence
                    // x: modelData.hexa_x
                    // y: modelData.hexa_y
                }
            }
        }


        VoitureItem {
            id: v
                voiture: Voiture {
                    x: 0
                    y: 55
                    vitesse: 3
                    puissance: 1
                    color: "green"
                }
            }

        VoitureItem{
            voiture: Voiture{
                x:50
                y:140
                vitesse: 2
                puissance: 1
                color: "red"
            }
        }


        Button{

            text: "test"
            onClicked: {
                //var index = maillage.lignes*1+0
                console.log(maillage.hexa2d[1][1]);
                maillage.hexa2d[1][1].containsCar = !maillage.hexa2d[1][1].containsCar;
                //maillage.hexagones[index].containsCar = !maillage.hexagones[index].containsCar

               /* maillage.hexagones[index].containsCar = !maillage.hexagones[index].containsCar
                maillage.hexagones[index-1].containsCar = !maillage.hexagones[index-1].containsCar
                maillage.hexagones[index+1].containsCar = !maillage.hexagones[index+1].containsCar

                maillage.hexagones[index-maillage.lignes-1].containsCar = !maillage.hexagones[index-maillage.lignes-1].containsCar
                maillage.hexagones[index-maillage.lignes].containsCar = !maillage.hexagones[index-maillage.lignes].containsCar

                maillage.hexagones[index+maillage.lignes-1].containsCar = !maillage.hexagones[index+maillage.lignes-1].containsCar
                maillage.hexagones[index+maillage.lignes].containsCar = !maillage.hexagones[index+maillage.lignes].containsCar

                console.log("Centre:"+(index));
                console.log("Moins 1:"+(index-1));
                console.log("Plus 1:"+(index+1));

                console.log("Colonne-1:"+(index-maillage.lignes-1));
                console.log("Colonne -1 L +1: "+ (index-maillage.lignes));

                console.log("Colonne+1:"+(index+maillage.lignes-1));
                console.log("Colonne +1 L +1: "+ (index+maillage.lignes));*/

            }

            anchors{
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }
        }


        property int nb: 0

    }




}
