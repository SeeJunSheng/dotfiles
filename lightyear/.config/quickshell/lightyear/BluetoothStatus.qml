import QtQuick

Text {
	required property BluetoothService bluetoothService

	text: "B"
	color: Style.textPrimary
	opacity: bluetoothService.enabled ? 1.0 : 0.35
	font.pixelSize: Style.fontSizeLabel
}
