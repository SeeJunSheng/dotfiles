import QtQuick
import Quickshell

PanelWindow {
	id: root

	required property var modelData

	screen: modelData

	implicitHeight: 64

	color: "transparent"
	exclusionMode: ExclusionMode.Ignore

	anchors {
		bottom: true
		left: true
		right: true
	}

	margins {
		left: Math.max(0, Math.floor((root.screen.width - 360) / 2))
		right: Math.max(0, Math.floor((root.screen.width - 360) / 2))
	}

	Rectangle {
		anchors.fill: parent

		radius: 32
		color: "#aa222222"
	}
}
