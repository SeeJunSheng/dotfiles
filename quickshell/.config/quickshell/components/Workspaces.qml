import QtQuick
import Quickshell.Hyprland

Row {
	id: workspaceRow

	required property var targetScreen
	readonly property var targetMonitor: Hyprland.monitorFor(targetScreen)

	spacing: 8

	Repeater {
		model: Hyprland.workspaces

		Item {
			required property var modelData

			visible: modelData.id > 0
				&& modelData.monitor === workspaceRow.targetMonitor

			width: workspaceText.implicitWidth + 16
			height: 24

			Text {
				id: workspaceText

				anchors.centerIn: parent

				text: modelData.name
				color: modelData.focused
					? "white"
					: modelData.active
						? "#bbbbbb"
						: "#666666"
			}

			MouseArea {
				anchors.fill: parent

				cursorShape: Qt.PointingHandCursor

				onClicked: modelData.activate()
			}
		}
	}
}
