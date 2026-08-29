import QtQuick
import Quickshell.Networking

Row {
	spacing: 4

	Repeater {
		model: Networking.devices

		Text {
			required property var modelData

			visible: modelData.connected

			text: DeviceType.toString(modelData.type)
			color: "white"
		}
	}
}
