import QtQuick
import Quickshell
import "../services" as Services

PanelWindow {
	id: barWindow

	required property var modelData

	screen: modelData

	implicitHeight: Services.Settings.barHeight

	color: Services.Settings.barBackgroundColor

	anchors {
		top: true
		left: true
		right: true
	}

	Item {
		anchors.fill: parent

		Workspaces {
			targetScreen: barWindow.screen

			anchors {
				left: parent.left
				leftMargin: Services.Settings.barOuterMargin
				verticalCenter: parent.verticalCenter
			}
		}

		Clock {
			anchors.centerIn: parent
		}

		Row {
			spacing: Services.Settings.barComponentSpacing

			anchors {
				right: parent.right
				rightMargin: Services.Settings.barOuterMargin
				verticalCenter: parent.verticalCenter
			}

			Tray {}
			NetworkStatus {}
			BluetoothStatus {}
			Audio {}
		}
	}
}
