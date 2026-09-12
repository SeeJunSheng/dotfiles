import QtQuick

Text {
	required property NetworkingService networkingService

	text: "N"
	color: Style.textPrimary
	opacity: networkingService.wifiConnected
		|| networkingService.wiredConnected
			? 1.0
			: 0.35
	font.pixelSize: Style.fontSizeLabel
}
