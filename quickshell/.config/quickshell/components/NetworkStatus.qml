import QtQuick
import Quickshell.Networking
import "../services" as Services

Row {
	spacing: Services.Settings.statusSpacing

	Repeater {
		model: Networking.devices

		Text {
			required property var modelData

			visible: modelData.connected

			text: DeviceType.toString(modelData.type)
			color: Services.Settings.appearanceTextColor
		}
	}
}
