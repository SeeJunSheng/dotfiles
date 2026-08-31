import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import "../services" as Services

Row {
	spacing: Services.Settings.traySpacing

	Repeater {
		model: SystemTray.items

		IconImage {
			id: trayIcon

			source: modelData.icon
			implicitSize: Services.Settings.trayIconSize

			QsMenuAnchor {
				id: trayMenu

				menu: modelData.menu

				anchor {
					item: trayIcon
					edges: Edges.Bottom | Edges.Right
					gravity: Edges.Bottom | Edges.Left
				}
			}

			MouseArea {
				anchors.fill: parent

				acceptedButtons: Qt.LeftButton | Qt.RightButton
				cursorShape: Qt.PointingHandCursor

				onClicked: mouse => {
					if (mouse.button === Qt.LeftButton) {
						if (modelData.onlyMenu && modelData.hasMenu) {
							trayMenu.open()
						} else {
							modelData.activate()
						}
					} else if (
						mouse.button === Qt.RightButton
						&& modelData.hasMenu
					) {
						trayMenu.open()
					}
				}
			}
		}
	}
}
