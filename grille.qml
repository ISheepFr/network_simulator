import QtQuick 2.15
import QtLocation
import QtPositioning


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
    }




}
