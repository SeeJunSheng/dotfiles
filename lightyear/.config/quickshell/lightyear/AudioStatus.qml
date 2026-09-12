import Quickshell
import QtQuick

PanelWindow {
	required property var targetScreen
	required property AudioService audioService

	screen: targetScreen
	implicitWidth: audioText.implicitWidth + Style.spacingMedium * 2
	implicitHeight: audioText.implicitHeight + Style.spacingSmall * 2
	color: "transparent"
	aboveWindows: false
	exclusionMode: ExclusionMode.Ignore
	focusable: false
	visible: audioService.outputName.length > 0

	anchors {
		top: true
		right: true
	}

	margins {
		top: Style.spacingLarge
		right: Style.spacingLarge
	}

	Text {
		id: audioText

		anchors.centerIn: parent
		text: audioService.muted
			? audioService.outputName + " · Muted"
			: audioService.outputName + " · " + Math.round(audioService.volume * 100) + "%"
		color: Style.textPrimary
		font.pixelSize: Style.fontSizeLabel
	}
}
