import QtQuick
import QtQuick.Controls
import QtQuick.VirtualKeyboard

ApplicationWindow {
  id: window

  title: Qt.application.name

  visible: true
  width: 640
  height: 480

  Pane {
    anchors.centerIn: parent
    Material.elevation: 6

    Column {
      RadioButton {
        text: qsTr("Small")
      }
      RadioButton {
        Material.accent: "green"
        text: qsTr("Medium")
        checked: true
      }
      RadioButton {
        Material.background: "red"
        text: qsTr("Large")
      }
    }
  }

  InputPanel {
    id: keyboard

    z: 99
    x: 0
    y: window.height
    width: window.width

    states: State {
      name: "visible"
      when: keyboard.active
      PropertyChanges {
        target: keyboard
        y: window.height - keyboard.height
      }
    }

    transitions: Transition {
      from: ""
      to: "visible"
      reversible: true
      ParallelAnimation {
        NumberAnimation {
          properties: "y"
          duration: 250
          easing.type: Easing.InOutQuad
        }
      }
    }
  }
}
