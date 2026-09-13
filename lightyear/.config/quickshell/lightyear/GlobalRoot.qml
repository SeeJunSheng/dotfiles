import Quickshell
import Quickshell.Hyprland
import QtQuick

Scope {
	id: root

	readonly property AudioService audioService: audio
	readonly property NetworkingService networkingService: networking
	readonly property BluetoothService bluetoothService: bluetooth

	readonly property bool panelShortcutHeld: panelShortcut.pressed

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
	}

	Component.onCompleted: {
		console.log("Lightyear global root ready")
	}

	Component.onDestruction: {
		console.log("Lightyear global root removed")
	}
}
