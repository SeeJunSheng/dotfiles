import QtQuick
import Quickshell

PanelWindow {
	id: root

	required property var modelData

	screen: modelData

	implicitWidth: 260
	implicitHeight: 260

	color: "transparent"
	exclusionMode: ExclusionMode.Ignore

	anchors {
		bottom: true
		left: true
	}

	Rectangle {
		anchors {
			bottom: parent.bottom
			left: parent.left
		}

		width: 260
		height: 64
		radius: 32
		color: "#aa222222"
	}

	Rectangle {
		anchors {
			bottom: parent.bottom
			left: parent.left
		}

		width: 64
		height: 260
		radius: 32
		color: "#aa222222"
	}
}
