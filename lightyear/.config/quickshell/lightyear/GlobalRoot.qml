import Quickshell
import QtQuick

Scope {
	AudioService {}

	Component.onCompleted: {
		console.log("Lightyear global root ready")
	}

	Component.onDestruction: {
		console.log("Lightyear global root removed")
	}
}
