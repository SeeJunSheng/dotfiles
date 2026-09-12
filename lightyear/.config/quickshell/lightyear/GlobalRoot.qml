import Quickshell
import Quickshell.Hyprland
import QtQuick

Scope {
	id: root

	readonly property AudioService audioService: audio
	readonly property NetworkingService networkingService: networking
	readonly property BluetoothService bluetoothService: bluetooth

	readonly property bool panelShortcutHeld: panelShortcut.pressed
	property string panelTargetScreenName: ""

	AudioService {
		id: audio
	}

	NetworkingService {
		id: networking
	}

	BluetoothService {
		id: bluetooth
	}

	Capabilities {
		audioService: audio
		networkingService: networking
		bluetoothService: bluetooth
	}

	GlobalShortcut {
		id: panelShortcut

		appid: "lightyear"
		name: "raisePanels"
		description: "Raise Lightyear panels"

		onPressed: {
			const monitor = Hyprland.focusedMonitor

			root.panelTargetScreenName = monitor === null
				? ""
				: monitor.name
		}

		onReleased: {
			root.panelTargetScreenName = ""
		}
	}

	Component.onCompleted: {
		console.log("Lightyear global root ready")
	}

	Component.onDestruction: {
		console.log("Lightyear global root removed")
	}
}
