import Quickshell
import QtQuick

Scope {
	required property var modelData
	property string screenName: ""

	Component.onCompleted: {
		screenName = modelData.name
		console.log("Lightyear screen added:", screenName)
	}

	Component.onDestruction: {
		console.log("Lightyear screen removed:", screenName)
	}
}
