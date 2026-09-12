import Quickshell
import QtQuick

Scope {
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
