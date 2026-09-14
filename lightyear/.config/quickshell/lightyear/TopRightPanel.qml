import Quickshell
import QtQuick

PanelWindow {
	id: root

	required property var targetScreen

	required property AudioService audioService
	required property NetworkingService networkingService
	required property BluetoothService bluetoothService

	required property bool armed
	property bool latched: false
	readonly property bool raised: armed || latched
	readonly property bool revealed: latched

	screen: targetScreen
	implicitWidth: content.implicitWidth + Style.spacingMedium * 2
	implicitHeight: content.implicitHeight + Style.spacingSmall * 2
	color: "transparent"
	aboveWindows: root.raised
	exclusionMode: ExclusionMode.Ignore
	focusable: false
	visible: true

	anchors {
		top: true
		right: true
	}

	margins {
		top: Style.spacingLarge
		right: Style.spacingLarge
	}

	MouseArea {
		id: activationRegion

		anchors.fill: parent
		hoverEnabled: true

		onEntered: {
			if (root.armed)
				root.latched = true
		}

		onExited: {
			root.latched = false
		}
	}

	Item {
		id: surface

		anchors.fill: parent
		opacity: root.revealed ? 1.0 : 0.0

		Behavior on opacity {
			NumberAnimation {
				duration: Style.animationMedium
				easing.type: Easing.OutCubic
			}
		}

		Rectangle {
			anchors.fill: parent

			color: Style.panelBackground
			radius: Style.panelRadius
		}

		Row {
			id: content

			anchors.centerIn: parent
			spacing: Style.spacingMedium

			AudioStatus {
				audioService: root.audioService
			}

			NetworkStatus {
				networkingService: root.networkingService
			}

			BluetoothStatus {
				bluetoothService: root.bluetoothService
			}
		}
	}
}
