import Quickshell
import QtQuick

Scope {
	id: root

	required property var modelData
	required property AudioService audioService

	property string screenName: ""

	Clock {
		targetScreen: modelData
	}

	AudioStatus {
		targetScreen: modelData
		audioService: root.audioService
	}

	Component.onCompleted: {
		screenName = modelData.name
		console.log("Lightyear screen added:", screenName)
	}

	Component.onDestruction: {
		console.log("Lightyear screen removed:", screenName)
	}
}
