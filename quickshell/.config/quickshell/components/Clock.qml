import QtQuick
import Quickshell

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

		text: Qt.formatDateTime(clock.date, "hh:mm")
		color: "white"
	}
}
