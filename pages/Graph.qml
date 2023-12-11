import QtQuick 2.15
import QtCharts 2.15

  Item {
    /* Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: chartView.updatePlot()
    } */
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
            min: -15
            max: 15
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
        
        Component.onCompleted:{
            mainApp.valueChanged.connect(updatePlot);
        }
        
        function updatePlot() {
            reff_vSeries.append(reff_vSeries.count, mainApp.value['reff_v']);
            aktualSeries.append(reff_vSeries.count, mainApp.value['aktual']);
            console.log(mainApp.value['reff_v'], mainApp.value['aktual']);

            if (reff_vSeries.count > axisX.max - axisX.min) {
                axisX.min++;
                axisX.max++;
            }
        }
    }
}