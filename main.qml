import QtQuick
import QtQuick.Controls
import QtPositioning
import QtLocation
import Try 1.0
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Window {
    id: main_w
    width: 800
    height: 600
    visible: true
    title: qsTr("Hello World")

    property double lat: 47.750839
    property double lng: 7.335888

    property bool menuShow: true
    property bool simulationStarted: false
    property int elapsedTime: 0

    property bool configDone: false

    property int nb_voitures
    property int minFrequency
    property int maxFrequency

    property double facteurAccel: 1.0


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
        center: QtPositioning.coordinate(lat,lng)
        zoomLevel: 14

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

    }

    Map{
        id:mapOverlay
        anchors.fill: parent
        plugin: Plugin{ name: "itemsoverlay"}
        center: mapview.center
        color: 'transparent'

        minimumFieldOfView: mapview.minimumFieldOfView
        maximumFieldOfView: mapview.maximumFieldOfView
        minimumTilt: mapview.minimumTilt
        maximumTilt: mapview.maximumTilt
        minimumZoomLevel: mapview.minimumZoomLevel
        maximumZoomLevel: mapview.maximumZoomLevel
        zoomLevel: mapview.zoomLevel
        tilt: mapview.tilt;
        bearing: mapview.bearing
        fieldOfView: mapview.fieldOfView
        z: mapview.z +1

        MapQuickItem{
            id:q
            Maillage{
                id:maillage
                lignes:10
                colonnes:10
                    }

            Repeater {
                id: rep
                model: maillage.hexa2d
                    delegate: Repeater {
                        model: modelData
                            delegate: HexagoneItem {
                            hexagone: modelData
                            wdth: parent.parent.width
                            hght: parent.parent.height
                        // x et y dépendent de la structure de Hexagone, ajuste-les en conséquence
                        // x: modelData.hexa_x
                        // y: modelData.hexa_y

                                                    }
                                        }
                    }

            /*VoitureItem{
                voiture: Voiture{
                    x: 5
                    y: 5
                    vitesse: 5
                    puissance: 5
                    color: "red"
                                }
                        }

            VoitureItem{
                voiture: Voiture{
                    x: 0
                    y: 0
                    vitesse: 2
                    puissance: 5
                    color: "green"
                                }
                        }
            VoitureItem{
                voiture: Voiture{
                    x: 0
                    y: 200
                    vitesse: 1
                    puissance: 5
                    color: "blue"
                                }
                        }*/

        coordinate: maillage.coordinate
        sourceItem: q
        visible: true
    }

    Button{
        text: "+"
        onClicked: menuShow = !menuShow
    }



    MyMenu {
        id: menu
        visible: menuShow
        states: [
                     State { when: menuShow;
                             PropertyChanges {   target: menu; opacity: 1.0    }},
                     State { when: !menuShow;
                             PropertyChanges {   target: menu; opacity: 0.0    }}
                 ]
                 transitions: [ Transition { NumberAnimation { property: "opacity"; duration: 500}} ]
    }







}


}