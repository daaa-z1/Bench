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
            id: lineSeries1
            name: "Command V"
            axisX: axisX
            axisY: axisY
            useOpenGL: true
        }

        LineSeries {
            id: lineSeries2
            name: "Actual Pos"
            axisX: axisX
            axisY: axisY
            useOpenGL: true
        }
        
        Component.onCompleted:{
            mainApp.valueChanged.connect(updatePlot);
        }
        
        function updatePlot() {
            lineSeries1.append(lineSeries1.count, mainApp.value['reff_v']);
            lineSeries2.append(lineSeries2.count, mainApp.value['aktual']);
            console.log(mainApp.value['reff_v'], mainApp.value['aktual']);

            if (lineSeries1.count > axisX.max - axisX.min) {
                axisX.min++;
                axisX.max++;
            }
        }
    }
}