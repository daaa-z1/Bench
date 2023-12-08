import QtQuick 2.15
import QtQuick.Controls 2.15
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
            minimumValue: mainApp.parameter["reff_v"]["minValue"]
            maximumValue: mainApp.parameter["reff_v"]["maxValue"]
            value: mainApp.value["reff_v"]
            // Konfigurasi lainnya...
        }

        CircularGauge {
            id: gauge2
            Layout.fillWidth: true
            Layout.fillHeight: true
            minimumValue: mainApp.parameter["aktual"]["minValue"]
            maximumValue: mainApp.parameter["aktual"]["maxValue"]
            value: mainApp.value["aktual"]
            // Konfigurasi lainnya...
        }
    }
}
