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
            //border.color: "black"
            //border.width: 5


            y:parent.height - (parent.height / 4)

            RowLayout{

                width: menu.width
                height: menu.height

                ColumnLayout{
                    Layout.margins: 10
                    TextField{

                        text:{
                            function formatTime(ms) {

                                var ms_ =ms % 1000
                                var seconds = Math.round(ms / 1000);
                                var minutes = Math.floor((seconds % 3600) / 60);
                                seconds = seconds % 60;

                                return pad(minutes) + ":" + pad(seconds) + ":" + pad(ms_);
                            }

                            function pad(value) {
                                return (value < 10 ? "0" : "") + value;
                            }

                            text: formatTime(elapsedTime);
                        }

                        readOnly: true
                        //Layout.alignment: horizontalCenter
                        Layout.preferredWidth: parent.width

                    }



                    RowLayout{

                        Button{
                            id: less
                            text: "<<"
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            onClicked:{
                                if(facteurAccel - 0.1 > 0.0)
                                {
                                    facteurAccel -= 0.1
                                }

                                else{
                                    enabled: false
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
                                facteurAccel += 0.1
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
                }
            }

            InitForm{
                visible: configShow
            }
        }




