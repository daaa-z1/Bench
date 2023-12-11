import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

Item {
    id: dashboard
    anchors.fill: parent
    Material.theme: Material.Dark
    Material.accent: Material.Blue

    GridLayout {
        id: layout
        anchors.fill: parent
        columns: 2

        CircularGauge {
            id: gauge1
            Layout.fillWidth: true
            Layout.fillHeight: true
            minimumValue: -10
            maximumValue: 10
            value: mainApp.value["reff_v"]
            style: CircularGaugeStyle{
            tickmarkStepSize: 1
            }
            
            Text {
                anchors{
                    bottom: gauge1.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                text: gauge1.value + "V"
            }
        }

        CircularGauge {
            id: gauge2
            Layout.fillWidth: true
            Layout.fillHeight: true
            minimumValue: -10
            maximumValue: 10
            value: mainApp.value['aktual']
            style: CircularGaugeStyle{
            tickmarkStepSize: 1
            }
            
            Text {
                anchors{
                    bottom: gauge2.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                text: gauge2.value + "V"
            }
        }
    }
    
    Connections {
        target: mainApp
    }
    
}
