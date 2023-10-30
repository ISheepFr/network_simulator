import QtQuick 2.15
import QtLocation
import QtPositioning
import Try 1.0

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
            lignes: 12
            colonnes: 30
        }


      /*  Connections{
            target: Maillage
            onL_change: label.text = "l_changed"
            onC_change: label.text = "c_changed"
        }*/

        Repeater {
            model: maillage.hexagones
            delegate : HexagoneItem {
                hexagone: modelData
                wdth: parent.width
                hght: parent.height

            }

        }




        property int nb: 0

        /*Repeater {
            model: maillage.hexagones
            delegate: Row {
                Repeater {
                    model: modelData
                    delegate: Column {
                        Repeater{
                            model:modelData
                            delegate: HexagoneItem{
                                hexagone: modelData
                                Component.onCompleted: {
                                            mapview.nb++
                                    console.log("Nouvelle instance HexagoneItem créée: "+mapview.nb);

                                        }
                            }
                        }
                    }

                }
            }
        }*/
    }




}
