import QtQuick

Text {
	required property AudioService audioService

	text: "♪"
	color: Style.textPrimary
	opacity: audioService.outputName.length > 0 ? 1.0 : 0.35
	font.pixelSize: Style.fontSizeLabel
}
