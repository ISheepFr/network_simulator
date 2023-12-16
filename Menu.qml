import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Item {
    //anchors.fill: parent


    Component.onCompleted:{
        console.log(width,height)
    }

    Rectangle {
            id: menu

            width: parent.width
            height: parent.height / 4
            color: "lightblue"
            //border.color: "black"
            //border.width: 5


            y:parent.height - (parent.height / 4)

            RowLayout{
                width: menu.width
                height: menu.height

                ColumnLayout{


                    Button {
                        id : settings
                        text: "Paramètres"
                        Layout.alignment: horizontalCenter
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Button {
                        text: "Start"
                        Layout.alignment: horizontalCenter
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }

                ColumnLayout{



                    Button {
                        id : s
                        text: "Paramètres"
                        Layout.alignment: horizontalCenter
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Button {
                        text: "Start"
                        Layout.alignment: horizontalCenter
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }



            }


        }

    Rectangle {
        property int side: 100
        width: side; height: side
        color: "red"

        MouseArea {
            anchors.fill: parent
            onClicked: console.log("Button clicked!")
        }
    }

}

