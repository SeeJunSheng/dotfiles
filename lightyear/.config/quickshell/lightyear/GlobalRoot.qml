import Quickshell
import QtQuick

Scope {
	Component.onCompleted: {
		console.log("Lightyear global root ready")
	}

	Component.onDestruction: {
		console.log("Lightyear global root removed")
	}
}
