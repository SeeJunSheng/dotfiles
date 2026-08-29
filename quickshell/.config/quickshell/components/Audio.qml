import QtQuick
import Quickshell.Services.Pipewire

Item {
	readonly property var sink: Pipewire.defaultAudioSink

	implicitWidth: audioText.implicitWidth
	implicitHeight: audioText.implicitHeight

	PwObjectTracker {
		objects: [sink]
	}

	Text {
		id: audioText

		text: sink && sink.audio
			? sink.audio.muted
				? "MUTE"
				: Math.round(sink.audio.volume * 100) + "%"
			: "--"

		color: "white"
	}

	MouseArea {
		anchors.fill: parent

		cursorShape: Qt.PointingHandCursor

		onClicked: {
			if (sink && sink.audio) {
				sink.audio.muted = !sink.audio.muted
			}
		}

		onWheel: wheel => {
			if (!sink || !sink.audio) {
				return
			}

			const step = wheel.angleDelta.y > 0 ? 0.05 : -0.05

			sink.audio.volume = Math.max(
				0,
				Math.min(1, sink.audio.volume + step)
			)
		}
	}
}
