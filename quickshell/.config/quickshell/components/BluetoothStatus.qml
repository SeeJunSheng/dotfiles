import QtQuick
import Quickshell.Bluetooth
import "../services" as Services

Item {
	id: root

	readonly property var adapter: Bluetooth.defaultAdapter
	readonly property bool popupVisible: bluetoothPopup.visible

	implicitWidth: bluetoothIcon.implicitWidth
	implicitHeight: bluetoothIcon.implicitHeight

	Text {
		id: bluetoothIcon

		text: Services.Settings.bluetoothIcon

		font.family: Services.Settings.iconFontFamily
		font.pixelSize: Services.Settings.bluetoothIconSize

		color: Services.Settings.appearanceTextColor
		opacity: root.adapter && root.adapter.enabled
			? 1.0
			: Services.Settings.bluetoothDisabledOpacity
	}

	MouseArea {
		anchors.fill: bluetoothIcon

		onClicked: {
			bluetoothPopup.visible = !bluetoothPopup.visible
		}
	}

	BluetoothPopup {
		id: bluetoothPopup

		anchor.item: bluetoothIcon
	}
}
