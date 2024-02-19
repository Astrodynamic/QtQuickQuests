import QtQuick
import QtQuick.Controls
import QtQuick.VirtualKeyboard

ApplicationWindow {
  id: window

  title: Qt.application.name

  width: 640
  height: 480
  visible: true

  InputPanel {
    id: inputPanel
    z: 99
    x: 0
    y: window.height
    width: window.width

    states: State {
      name: "visible"
      when: inputPanel.active
      PropertyChanges {
        target: inputPanel
        y: window.height - inputPanel.height
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
