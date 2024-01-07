import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts


    //anchors.fill: parent

    Rectangle {
            id: menu

            property bool configShow: false

            width: parent.width
            height: parent.height / 4
            color: "white"
            border.color: "grey"
            border.width: 3


            y:parent.height - (parent.height / 4)

            RowLayout{

                width: menu.width
                height: menu.height

                ColumnLayout{
                    Layout.margins: 10
                    TextField {
                                text: {
                                    var minutes = Math.floor(elapsedTime / 60)
                                    var seconds = elapsedTime % 60

                                    return minutes.toString().padStart(2, '0') + ":" + seconds.toString().padStart(2, '0')
                                }
                                readOnly: true
                                Layout.preferredWidth: parent.width
                            }

                    RowLayout{

                        Button{
                            id: less
                            text: "<<"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            onClicked:{
                                if(facteurAccel - 0.2 > 0.0)
                                {
                                    facteurAccel -= 0.2
                                }
                                else{
                                    enabled: false
                                    facteurAccel = 0.0
                                }
                            }
                        }
                        Button{
                            id: start
                            text: "START"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            enabled: configDone
                            onClicked:{
                                if(text == "START"){
                                    text = "STOP"
                                }else{
                                    text = "START"
                                }

                                simulationStarted = !simulationStarted
                            }
                        }
                        Button{

                                id: more
                                text: ">>"
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                onClicked:{
                                    facteurAccel += 0.2
                                }

                            }
                        }


                    Button {
                        id : settings
                        text: "Configuration"
                        //Layout.alignment: horizontalCenter
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        onClicked:{
                            configShow = !configShow
                            settings.enabled = false
                            more.enabled = false
                            less.enabled = false
                            start.enabled = false
                        }
                    }

                }

                ColumnLayout{
                    Layout.margins: 20
                    Label{
                        text: "Simulation"
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Label{
                        text: "Nombre de voiture : "+ nb_voitures
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Label{
                        text: "Plage de fréquence : "+ minFrequency + " GHz - " + maxFrequency + " Ghz"
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Label{
                        text: "Puissance : aléatoire"
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Label{
                        text: "Facteur d'acceleration : "+facteurAccel
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                    }
                }
            }

            InitForm{
                visible: configShow
            }
        }




