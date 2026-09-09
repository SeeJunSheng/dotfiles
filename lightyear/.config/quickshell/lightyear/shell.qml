import Quickshell
import QtQuick

ShellRoot {
	Variants {
		model: Quickshell.screens

		Scope {
			property var modelData
			property string screenName: ""

			Component.onCompleted: {
				screenName = modelData.name
				console.log("Lightyear screen added:", screenName)
			}

			Component.onDestruction: {
				console.log("Lightyear screen removed:", screenName)
			}
		}
	}
}
