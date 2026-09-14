import QtQuick

Text {
	id: root

	required property AudioService audioService

	text: "♪"
	color: Style.textPrimary
	opacity: audioService.outputName.length > 0 ? 1.0 : 0.35
	font.pixelSize: Style.fontSizeLabel

	scale: hover.hovered ? 1.3 : 1.0

	Behavior on scale {
		NumberAnimation {
			duration: Style.animationMedium
			easing.type: Easing.OutCubic
		}
	}

	HoverHandler {
		id: hover
		cursorShape: Qt.PointingHandCursor
	}

	TapHandler {
		onTapped: {
			console.log(
				"Audio status clicked:",
				root.audioService.outputName,
				Math.round(root.audioService.volume * 100) + "%",
				root.audioService.muted ? "muted" : "unmuted"
			)
		}
	}
}
