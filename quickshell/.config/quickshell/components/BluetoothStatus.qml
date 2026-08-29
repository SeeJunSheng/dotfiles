import QtQuick
import Quickshell.Bluetooth

Row {
	id: bluetoothRow

	readonly property var adapter: Bluetooth.defaultAdapter

	spacing: 4

	Text {
		text: bluetoothRow.adapter
			? bluetoothRow.adapter.enabled
				? "BT"
				: "BT OFF"
			: "NO BT"

		color: "white"
	}

	Repeater {
		model: Bluetooth.devices

		Text {
			required property var modelData

			visible: modelData.connected

			text: modelData.name
			color: "white"
		}
	}
}
