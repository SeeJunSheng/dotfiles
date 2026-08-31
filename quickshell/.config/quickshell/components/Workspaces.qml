import QtQuick
import Quickshell.Hyprland
import "../services" as Services

Row {
	id: workspaceRow

	required property var targetScreen
	readonly property var targetMonitor: Hyprland.monitorFor(targetScreen)

	spacing: Services.Settings.workspaceSpacing

	Repeater {
		model: Hyprland.workspaces

		Item {
			required property var modelData

			visible: modelData.id > 0
				&& modelData.monitor === workspaceRow.targetMonitor

			width: workspaceText.implicitWidth
				+ Services.Settings.workspaceHorizontalPadding * 2

			height: Services.Settings.workspaceHeight

			Text {
				id: workspaceText

				anchors.centerIn: parent

				text: modelData.name
				color: modelData.focused
					? Services.Settings.workspaceFocusedColor
					: modelData.active
						? Services.Settings.workspaceActiveColor
						: Services.Settings.workspaceInactiveColor
			}

			MouseArea {
				anchors.fill: parent

				cursorShape: Qt.PointingHandCursor

				onClicked: modelData.activate()
			}
		}
	}
}
