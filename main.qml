import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: "Servo Valve Tester"

    Material.theme: Material.Dark
    Material.accent: Material.Blue

    StackView {
        id: stackView
        initialItem: Qt.resolvedUrl("pages/Dashboard.qml")
        anchors.fill: parent
    }

    footer: Rectangle {
        width: parent.width
        height: 50
        color: Material.accent

        Row {
            anchors.centerIn: parent

            Button {
                id: dashboardButton
                text: "Dashboard"
                onClicked: stackView.replace(Qt.resolvedUrl("pages/Dashboard.qml"))
            }

            Button {
                id: graphButton
                text: "Graph"
                onClicked: stackView.replace(Qt.resolvedUrl("pages/Graph.qml"))
            }
        }
    }
}
