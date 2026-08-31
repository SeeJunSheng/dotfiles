import QtQuick
import Quickshell
import "../services" as Services

Item {
	implicitWidth: clockText.implicitWidth
	implicitHeight: clockText.implicitHeight

	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}

	Text {
		id: clockText
		anchors.centerIn: parent

		text: Qt.formatDateTime(
			clock.date,
			Services.Settings.clockFormat
		)
		color: Services.Settings.appearanceTextColor
	}
}
