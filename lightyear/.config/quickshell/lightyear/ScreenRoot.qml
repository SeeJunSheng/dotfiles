import Quickshell
import QtQuick

Scope {
	id: root

	required property var modelData
	required property AudioService audioService
	required property NetworkingService networkingService
	required property BluetoothService bluetoothService

	property string screenName: ""

	Clock {
		targetScreen: modelData
	}

	TopRightPanel {
		targetScreen: modelData
		audioService: root.audioService
		networkingService: root.networkingService
		bluetoothService: root.bluetoothService
	}

	Component.onCompleted: {
		screenName = modelData.name
		console.log("Lightyear screen added:", screenName)
	}

	Component.onDestruction: {
		console.log("Lightyear screen removed:", screenName)
	}
}
