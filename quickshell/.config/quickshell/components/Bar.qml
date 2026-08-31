import QtQuick
import Quickshell
import "../services" as Services

PanelWindow {
	id: barWindow

	required property var modelData

	screen: modelData

	implicitHeight: Services.Settings.barHeight

	color: "#202020"

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
				leftMargin: 12
				verticalCenter: parent.verticalCenter
			}
		}

		Clock {
			anchors.centerIn: parent
		}

		Row {
			spacing: 12

			anchors {
				right: parent.right
				rightMargin: 12
				verticalCenter: parent.verticalCenter
			}

			Tray {}
			NetworkStatus {}
			BluetoothStatus {}
			Audio {}
		}
	}
}
