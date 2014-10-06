import QtQuick 2.0
import Ubuntu.Components 0.1

Column {
    property alias field: inputField
    property alias label: labelField
    property alias labelText: labelField.text
    property alias value: inputField.text

    id: root
    spacing: units.gu(0.5)
    //width: flickable.width

    Label {
        id: labelField
    }

    TextField {
        id: inputField
    }
}
