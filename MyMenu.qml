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

                        text:  "00:00:"+elapsedTime
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
                    Layout.margins: 10
                    Label{
                        text: "Simulation"
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Label{
                        text: "Nombre de voiture : oppzêrpkgpêtopêgege"
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }

            InitForm{
                visible: configShow
            }
        }




