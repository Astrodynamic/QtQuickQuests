import QtQuick
import QtQuick.Controls
import QtQuick.VirtualKeyboard

import Cobot

Window {
  id: window

  title: Qt.application.name + " " + Qt.application.version

  flags: Qt.FramelessWindowHint | Qt.Window
  visibility: Qt.WindowFullScreen
  visible: true

  StackView {
    anchors.fill: parent
    initialItem: CobotScene {}
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
