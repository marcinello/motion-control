import QtQuick 2.0
import Ubuntu.Components 1.1
import "../components"

Page {
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
            objectName: "saveSettingsAction"
            iconName: "save"
            text: i18n.tr("Save")
            description: i18n.tr("Save settings")
            keywords: i18n.tr("Save;Settings;Edit")
            onTriggered: {
                settings.address = addressField.value;
                settings.port = portField.value;
                settings.thread = threadField.value;
                settings.username = usernameField.value;
                settings.password = passwordField.value;
            }
        }
    ]

    Column {
        spacing: units.gu(2)

        LabeledTextField {
            id: addressField
            labelText: "Address"
            value: settings.address
        }
        LabeledTextField {
            id: portField
            labelText: "Port"
            value: settings.port
        }
        LabeledTextField {
            id: threadField
            labelText: "Thread"
            value: settings.thread
        }
        LabeledTextField {
            id: usernameField
            labelText: "Username"
            value: settings.username
        }
        LabeledTextField {
            id: passwordField
            labelText: "Password"
            value: settings.password
        }
    }
}

