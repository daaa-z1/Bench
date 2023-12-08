import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: "Servo Valve Tester"

    Rectangle {
        id: container
        anchors.fill: parent
        color: "#eaeaea30"
        StackView {
            id: stackView
            initialItem: Qt.resolvedUrl("pages/Dashboard.qml")
            anchors.fill: container
        }
    }

    footer: Rectangle {
        width: parent.width
        height: 50
        color: "#eaeaea30"

        Row {
            anchors.centerIn: parent
            spacing: 10

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
