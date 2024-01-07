import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import Try 1.0

Rectangle{
    color: "lightblue"
    id: form
    width: menu.width
    height: menu.height
    //anchors.centerIn: horizontalCenter

    RowLayout{
        ColumnLayout{
            RowLayout{
                Text{
                    text: "Nombre de voitures"
                    Layout.leftMargin: menu.width / 3
                    Layout.rightMargin: 10
                    Layout.topMargin: 10
                }

                SpinBox{
                    id : nbV
                    Layout.topMargin: 10
                    editable: true
                    from: 0
                    stepSize: 1
                }
            }

            RowLayout{
                Text {
                    text: "Fréquence minimal (Ghz):"
                    Layout.leftMargin: menu.width / 3
                    Layout.rightMargin: 10
                }

                SpinBox{
                    editable: true
                    id: minFreq
                    stepSize: 1
                    value: 30
                    to : 1000
                    from : 0
                }
}
            RowLayout{

                Text {
                    Layout.leftMargin: menu.width / 3
                    Layout.rightMargin: 10
                    text: "Fréquence maximal (Ghz):"
                }

                SpinBox{
                    editable: true
                    id: maxFreq
                    stepSize: 1
                    value: 50
                    to : 1000
                    from : 0
                }
            }

            RowLayout{
                Text {
                    Layout.leftMargin: menu.width / 3
                    Layout.rightMargin: 10
                    text: "Puissance :"
                }

                TextArea{
                    id: inp
                    placeholderText: "puissance 1, puissance 2, ..."
                }
            }

            RowLayout{
                CheckBox{
                    id: checkbox
                    Layout.leftMargin: menu.width / 3
                    Layout.rightMargin: 10
                    Layout.bottomMargin: 10
                    text: "Puissance aléatoire"
                    onCheckStateChanged: {
                        if(checked == true){
                            inp.clear()
                            inp.readOnly = true
                        }
                        else{
                            inp.readOnly = false
                        }
                    }

                }
            }

        }

        ColumnLayout{
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

                    nb_voitures = nbV.value
                    minFrequency = minFreq.value
                    maxFrequency = maxFreq.value

                    for(var i=0; i < nb_voitures; i++)
                    {
                    var randomColor = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                    /*var component = Qt.createComponent("VoitureItem.qml");


                            if (component !== null && component.status === Component.Ready) {
*/

                                var voitureItem = Qt.createQmlObject(` import Try 1.0
                                                                        VoitureItem{
                                                                            voiture: Voiture{
                                                                                x: ${i+10}
                                                                                y: ${(i+1)*60}
                                                                                vitesse: ${i+1}
                                                                                puissance: ${i+2}
                                                                                color: "${randomColor}"
                                                                                            }
                                                                                    }`
                        ,q,"dynamicsnippet");
                                console.log("bug")

                                /*if (voitureItem === null) {
                                            console.error("Error creating VoitureItem:", component.errorString());
                                        }
                                    } else {
                                        console.error("Error loading VoitureItem component:", component.errorString());
                                    }*/

                            }
                }
            }

        }

    }


}
