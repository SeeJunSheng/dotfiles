import Quickshell
import QtQuick

Scope {
	AudioService {
		id: audio
	}

	NetworkingService {
		id: networking
	}

	Capabilities {
		audioService: audio
	}

	Component.onCompleted: {
		console.log("Lightyear global root ready")
	}

	Component.onDestruction: {
		console.log("Lightyear global root removed")
	}
}
