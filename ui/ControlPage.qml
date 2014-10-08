import QtQuick 2.0
import Ubuntu.Components 1.1
import "../components"

Page {
    id: _controlPage
    title: i18n.tr("Motion Control")

    function requestCommand(command) {
        var url = settings.getFullThreadAddress() + "/detection/" + command;
        customdebug("requestStatus to: " + url);

        var request = new XMLHttpRequest();
        request.open('GET', url);
        request.setRequestHeader("Authorization", settings.getHttpAuthorization());
        request.onreadystatechange = function(event) {
            // TODO: error checking
            customdebug("requestStatus response: " + request.readyState + ", "+ request.statusText + request.responseText + request.responseXML);
            if (request.readyState == XMLHttpRequest.DONE) {
                statusText.text = request.responseText;
            }
        }

        request.send()
    }

    tools: ToolbarItems {
        id: toolbarSettings

        ToolbarButton {
            id: saveSettingsButton
            action: saveSettingsAction
        }
    }

    actions: [
        Action {
            id: saveSettingsAction
            objectName: "settingsAction"
            iconName: "settings"
            text: i18n.tr("Settings")
            description: i18n.tr("Application settings")
            keywords: i18n.tr("Settings;Edit")
            onTriggered: pageStack.push(Qt.resolvedUrl("./SettingsPage.qml"))
        }
    ]

    Column {
        width: parent.width
        spacing: units.gu(2)

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            margins: units.gu(2)
        }

        UbuntuShape {
            width: parent.width
            height: units.gu(20)
            color: "#d0dedf"

            Label {
                id: statusText
                text: "Unknown status"
                anchors.centerIn: parent
            }
        }

        Button {
            iconName: "reload"
            text: "Check status"
            iconPosition: "left"
            width: parent.width
            onClicked: requestCommand("status")
        }
        Button {
            iconName: "media-playback-start"
            text: "Start detection"
            iconPosition: "left"
            width: parent.width
            onClicked: requestCommand("start")
        }
        Button {
            iconName: "media-playback-pause"
            text: "Pause detection"
            iconPosition: "left"
            width: parent.width
            onClicked: requestCommand("pause")
        }
    }
}


