import Quickshell
import QtQuick

PanelWindow {
	required property var targetScreen

	screen: targetScreen
	implicitWidth: clockText.implicitWidth + 32
	implicitHeight: clockText.implicitHeight + 16
	color: "transparent"
	aboveWindows: false
	exclusionMode: ExclusionMode.Ignore
	focusable: false

	anchors {
		top: true
	}

	margins {
		top: 32
	}

	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}

	Text {
		id: clockText

		anchors.centerIn: parent
		text: Qt.formatDateTime(clock.date, "HH:mm")
		color: "white"
		font.pixelSize: 32
	}
}
