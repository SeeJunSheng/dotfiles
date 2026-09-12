import Quickshell
import QtQuick

Scope {
	readonly property AudioService audioService: audio
	readonly property NetworkingService networkingService: networking
	readonly property BluetoothService bluetoothService: bluetooth

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

	Component.onCompleted: {
		console.log("Lightyear global root ready")
	}

	Component.onDestruction: {
		console.log("Lightyear global root removed")
	}
}
