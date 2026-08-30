import QtQuick
import Quickshell.Widgets
import Quickshell.Services.SystemTray

Row {
	spacing: 6

	Repeater {
		model: SystemTray.items

		IconImage {
			source: modelData.icon
			implicitSize: 18
		}
	}
}
