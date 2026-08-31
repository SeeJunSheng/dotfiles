import QtQuick
import Quickshell.Services.Pipewire
import "../services" as Services

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
				? Services.Settings.audioMutedLabel
				: Math.round(sink.audio.volume * 100) + "%"
			: Services.Settings.audioUnavailableLabel

		color: Services.Settings.appearanceTextColor
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

			const step = wheel.angleDelta.y > 0
				? Services.Settings.audioVolumeStep
				: -Services.Settings.audioVolumeStep

			sink.audio.volume = Math.max(
				0,
				Math.min(1, sink.audio.volume + step)
			)
		}
	}
}
