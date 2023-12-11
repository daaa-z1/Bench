import QtQuick 2.15
import QtCharts 2.15

  Item {
    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: chartView.updatePlot()
    }
    ChartView {
        id: chartView
        anchors.fill: parent
        theme: ChartView.ChartThemeDark
        antialiasing: true

        ValueAxis {
            id: axisX
            min: 0
            max: 10
        }

        ValueAxis {
            id: axisY
            min: -10
            max: 10
        }

        LineSeries {
            id: reff_vSeries
            name: "Command V"
            axisX: axisX
            axisY: axisY
        }

        LineSeries {
            id: aktualSeries
            name: "Actual Pos"
            axisX: axisX
            axisY: axisY
        }
        
        function updatePlot() {
            reff_vSeries.append(reff_vSeries.count, mainApp.value['reff_v'])
            reff_vSeries.append(reff_vSeries.count, mainApp.value['aktual'])

            if (reff_vSeries.count > axisX.max - axisX.min) {
                axisX.min++;
                axisX.max++;
            }
        }
    }
}