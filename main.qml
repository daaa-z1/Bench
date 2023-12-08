import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Servo Valve Tester"

    Material.theme: Material.Dark
    Material.accent: Material.Blue

    StackView {
        id: stackView
        initialItem: Dashboard {}
        anchors.fill: parent
    }

    Button {
        id: dashboardButton
        text: "Dashboard"
        onClicked: stackView.replace(Dashboard {})
    }

    Button {
        id: graphButton
        text: "Graph"
        onClicked: stackView.replace(Graph {})
    }
}
