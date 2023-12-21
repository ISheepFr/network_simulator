import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Rectangle{
    color: "lightblue"
    id: form
    width: menu.width
    height: menu.height

    GridLayout{
        focus: true
        //Layout.fillHeight: true
        //Layout.fillWidth: true
        columns: 2

        Text{
            text: "Nombre de voitures"
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            Layout.topMargin: 10
        }

        SpinBox{
            from: 0
            stepSize: 1
        }

        Text {
            text: "Fréquence minimal (Ghz):"
            Layout.leftMargin: 10
            Layout.rightMargin: 10
        }

        SpinBox{
            id: s
            from: 0
            stepSize: 1
            property int decimals: 2
            property real realValue: value / 100

            validator: DoubleValidator {
                bottom: Math.min(s.from, s.to)
                top:  Math.max(s.from, s.to)
            }

            textFromValue: function(value, locale) {
                return Number(value / 100).toLocaleString(locale, 'f', s.decimals)
            }

            valueFromText: function(text, locale) {
                return Number.fromLocaleString(locale, text) * 100
            }

        }

        Text {
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            text: "Fréquence maximal (Ghz):"
        }

        SpinBox{
            id: s2
            from: 0
            stepSize: 1

            property int decimals: 2
            property real realValue: value / 100

            validator: DoubleValidator {
                bottom: Math.min(s2.from, s2.to)
                top:  Math.max(s2.from, s2.to)
            }

            textFromValue: function(value, locale) {
                return Number(value / 100).toLocaleString(locale, 'f', s2.decimals)
            }

            valueFromText: function(text, locale) {
                return Number.fromLocaleString(locale, text) * 100
            }

        }

        Text {
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            text: "Puissance :"
        }

        TextInput{
            id: inp
        }

        CheckBox{
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            Layout.bottomMargin: 10
            text: "Puissance aléatoire"
            checked: inp.readOnly
        }

        Text{
            text:""
        }

        Button{
            id: cancel
            text: "Annuler"
            onClicked:{

                configDone = true
                configShow = !configShow
                settings.enabled = true
                more.enabled = true
                less.enabled = true
                start.enabled = configDone

            }
        }

        Button{
            id: save
            text: "Enregistrer"
            onClicked:{
                configDone = true
                configShow = !configShow
                settings.enabled = true
                more.enabled = true
                less.enabled = true
                start.enabled = configDone
            }
        }
    }
}
