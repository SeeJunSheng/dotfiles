import Quickshell
import QtQuick

Scope {
	required property var modelData
	required property AudioService audioService

	property string screenName: ""

	Clock {
		targetScreen: modelData
	}

	Component.onCompleted: {
		screenName = modelData.name
		console.log("Lightyear screen added:", screenName)
	}

	Component.onDestruction: {
		console.log("Lightyear screen removed:", screenName)
	}
}
