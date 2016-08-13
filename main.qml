import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: window
    visible: true
    width: 155
    height: 350

    FileDialog {
    id: fileOpenDialog
    title: "Choose a File"
    nameFilters: ["Christmas files (*.xmas)", "All files (*)"]
    onAccepted: console.log(fileOpenDialog.fileUrl + " chosen.")
    onRejected: console.log("File open dialog cancelled.")
    }

    FileDialog {
    id: fileSaveDialog
    title: "Save File"
    property string location
    selectMultiple: false
    selectExisting: false
    nameFilters: ["Christmas files (*.xmas)", "All files (*)"]
    onAccepted: console.log(fileSaveDialog.fileUrl + " fake saved.")
    onRejected: console.log("File save dialog cancelled.")
    }

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem {
                text: "Open..."
                shortcut: "Ctrl+O"
                onTriggered: fileOpenDialog.open()
            }
            MenuItem {
                text: "Save As..."
                shortcut: "Ctrl+A"
                onTriggered: fileSaveDialog.open()
            }
            MenuItem {
                text: "Save"
                shortcut: "Ctrl+S"
                onTriggered: fileSaveDialog.open()
            }
            MenuItem {
                text: "Quit"
                shortcut: "Ctrl+Q"
                onTriggered: Qt.quit()
            }
        }
        Menu {
            title: "Donors"
            MenuItem {
                text: "Shuffle"
                shortcut: "Ctrl+F"
                //onTriggered: Qt.quit()
            }
            MenuItem {
                text: "Last Recipients"
                shortcut: "Ctrl+L"
                //onTriggered: Qt.quit()
            }
            MenuItem {
                text: "Show Stats"
                shortcut: "Ctrl+T"
                //onTriggered: Qt.quit()
            }
        }
    }

    GroupBox {
        id: buttonBox
        flat: false
        anchors.horizontalCenter: parent.horizontalCenter

        ColumnLayout {
            id: buttonColumn
            spacing: 4

            Label {
                text: qsTr("Click Your Own Name")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                text: qsTr("Brad")
                anchors.horizontalCenter: parent.horizontalCenter
                id: bradButton
            }
            Button {
                text: qsTr("Michelle")
                anchors.horizontalCenter: parent.horizontalCenter
                id: michelleButton
            }
            Button {
                text: qsTr("James")
                anchors.horizontalCenter: parent.horizontalCenter
                id: jamesButton
            }
            Button {
                text: qsTr("Laura")
                anchors.horizontalCenter: parent.horizontalCenter
                id: lauraButton
            }
            Button {
                text: qsTr("Jonathan")
                anchors.horizontalCenter: parent.horizontalCenter
                id: jonathanButton
            }
            Button {
                text: qsTr("Ann")
                anchors.horizontalCenter: parent.horizontalCenter
                id: annButton
            }
            Button {
                text: qsTr("Michael")
                anchors.horizontalCenter: parent.horizontalCenter
                id: michaelButton
            }
        }
    }

  Label {
        id: recipientLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: dividingLine.bottom
        x: 10
        width: 120
        height: 14
        text: qsTr("Recipient")
        anchors.topMargin: 6
        horizontalAlignment: Text.AlignHCenter
  }

     Rectangle {				// A horizontal line
        id: dividingLine
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: recipientTextEdit.bottom
        x: 10
        width: 120
        height: 1
        color: "#000000"
        anchors.topMargin: 12
        border.width: 0
     }

    TextEdit {
        id: recipientTextEdit
        anchors.horizontalCenter: recipientLabel.horizontalCenter
        anchors.top: buttonBox.bottom
        color: "forestgreen"
        text: "Awaiting Click..."
        x: 10
        width: 120
        height: 14
        anchors.topMargin: 12
        activeFocusOnPress: false
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        readOnly: true
    }
}
