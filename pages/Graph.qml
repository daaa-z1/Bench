import QtQuick 2.15
import QtCharts 2.15

ChartView {
    id: chartView
    anchors.fill: parent
    theme: ChartView.ChartThemeDark
    antialiasing: true

    LineSeries {
        id: reff_vSeries
        name: "reff_v"
        XYPoint { x: 0; y: mainApp.value["reff_v"] }
        // Konfigurasi lainnya...
    }

    LineSeries {
        id: aktualSeries
        name: "aktual"
        XYPoint { x: 0; y: mainApp.value["aktual"] }
        // Konfigurasi lainnya...
    }
}
