import Quickshell
import QtQuick

PanelWindow {
	required property var targetScreen

	screen: targetScreen
	implicitWidth: clockText.implicitWidth + Style.spacingMedium * 2
	implicitHeight: clockText.implicitHeight + Style.spacingSmall * 2
	color: "transparent"
	aboveWindows: false
	exclusionMode: ExclusionMode.Ignore
	focusable: false
	visible: Settings.clockEnabled

	anchors {
		top: true
	}

	margins {
		top: Style.spacingLarge
	}

	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}

	Text {
		id: clockText

		anchors.centerIn: parent
		text: Qt.formatDateTime(clock.date, "HH:mm")
		color: Style.textPrimary
		font.pixelSize: Style.clockFontSize
	}
}
