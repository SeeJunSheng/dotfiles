import QtQuick
import Quickshell

PanelWindow {
	id: barWindow

	required property var modelData

	screen: modelData

	implicitHeight: 36

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

			NetworkStatus {}
			BluetoothStatus {}
			Audio {}
		}
	}
}
