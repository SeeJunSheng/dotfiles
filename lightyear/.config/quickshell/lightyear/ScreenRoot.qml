import Quickshell
import QtQuick

Scope {
	id: root

	required property var modelData
	property string screenName: ""

	required property AudioService audioService
	required property NetworkingService networkingService
	required property BluetoothService bluetoothService

	required property bool panelShortcutHeld
	required property string panelTargetScreenName
	readonly property bool panelsRaised:
		panelShortcutHeld
		&& panelTargetScreenName === modelData.name

	Clock {
		targetScreen: modelData
	}

	TopRightPanel {
		targetScreen: modelData
		audioService: root.audioService
		networkingService: root.networkingService
		bluetoothService: root.bluetoothService

		raised: root.panelsRaised
	}

	Component.onCompleted: {
		screenName = modelData.name
		console.log("Lightyear screen added:", screenName)
	}

	Component.onDestruction: {
		console.log("Lightyear screen removed:", screenName)
	}
}
