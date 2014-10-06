import QtQuick 2.0
import Ubuntu.Components 1.1
import U1db 1.0 as U1db
import "ui"
import "components"

/*!
    \brief MainView with Tabs element.
           First Tab has a single Label and
           second Tab has a single ToolbarAction.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "com.ubuntu.developer.marcinello.motion-control"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)

    Settings {
        id: settings
    }

    // debug easier to turn off
    function customdebug(text) {
        console.debug("Debug: "+text);
    }

    Tabs {
        id: tabs
        Tab {
            title: i18n.tr("Home")

            page: ControlPage {
                objectName: "home"
            }
        }
        Tab {
            title: i18n.tr("Settings")

            page: SettingsPage {
                objectName: "settings"
            }
        }
    }
}

