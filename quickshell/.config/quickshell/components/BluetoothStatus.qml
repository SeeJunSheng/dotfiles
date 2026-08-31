import QtQuick
import Quickshell.Bluetooth
import "../services" as Services

Row {
	id: bluetoothRow

	readonly property var adapter: Bluetooth.defaultAdapter

	spacing: Services.Settings.statusSpacing

	Text {
		text: bluetoothRow.adapter
			? bluetoothRow.adapter.enabled
				? Services.Settings.bluetoothEnabledLabel
				: Services.Settings.bluetoothDisabledLabel
			: Services.Settings.bluetoothUnavailableLabel

		color: Services.Settings.appearanceTextColor
	}

	Repeater {
		model: Bluetooth.devices

		Text {
			required property var modelData

			visible: modelData.connected

			text: modelData.name
			color: Services.Settings.appearanceTextColor
		}
	}
}
