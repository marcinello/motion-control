import QtQuick 2.0
import U1db 1.0 as U1db

Item {
    id: settings

    property string address: settingsDocument.contents.address
    property string port: settingsDocument.contents.port
    property string thread: settingsDocument.contents.thread
    property string username: settingsDocument.contents.username
    property string password: settingsDocument.contents.password

    onAddressChanged: set("address", address)
    onPortChanged: set("port", port)
    onThreadChanged: set("thread", thread)
    onUsernameChanged: set("username", username)
    onPasswordChanged: set("password", password)

    function set(key, value) {
        var tempContents = settingsDocument.contents
        tempContents[key] = value
        settingsDocument.contents = tempContents
    }

    function get(key) {
        return settingsDocument.contents[key]
    }

    function getFullAddress() {
        if (settings.address == "") {
            return false;
        }

        return "http://" + settings.address + ":" + settings.port;
    }

    function getFullThreadAddress() {
        var returnAddress = settings.getFullAddress();
        if (!returnAddress) {
            return false;
        }

        var returnThread = settings.thread;
        if (!returnThread) {
            returnThread = 0;
        }

        return returnAddress + "/" + returnThread;
    }

    function getHttpAuthorization() {
        return "Basic " + Qt.btoa(settings.username + ":" + settings.password);
    }

    U1db.Database {
        id: settingsDatabase
        path: "settings.u1db"
    }

    U1db.Document {
        id: settingsDocument
        database: settingsDatabase
        docId: 'settings'
        create: true
        defaults: {
            "address": "",
            "port": "8080",
            "thread": "0",
            "username": "",
            "password": ""
        }
    }
}
