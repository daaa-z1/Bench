import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: "Servo Valve Tester"

    style: ApplicationWindowStyle {
        background: Rectangle {
            color: "#aeaeae"
        }
    }

    StackView {
        id: stackView
        initialItem: Qt.resolvedUrl("pages/Dashboard.qml")
        anchors.fill: parent
    }

    footer: Rectangle {
        width: parent.width
        height: 50
        color: "transparent"

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
