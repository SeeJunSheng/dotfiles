import Quickshell
import QtQuick

PanelWindow {
	id: root

	required property var targetScreen
	required property AudioService audioService
	required property NetworkingService networkingService
	required property BluetoothService bluetoothService

	screen: targetScreen
	implicitWidth: content.implicitWidth + Style.spacingMedium * 2
	implicitHeight: content.implicitHeight + Style.spacingSmall * 2
	color: "transparent"
	aboveWindows: false
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
