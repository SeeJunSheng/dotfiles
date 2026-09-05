import QtQuick

CornerPanel {
	id: root

	topEdge: true
	leftEdge: false

	holdOpen:
		wifiStatus.popupVisible
		|| bluetoothStatus.popupVisible

	BluetoothStatus {
		id: bluetoothStatus

		anchors {
			top: parent.top
			right: parent.right

			topMargin: 20
			rightMargin: root.expandedThickness + 12
		}
	}

	WifiStatus {
		id: wifiStatus

		anchors {
			top: parent.top
			right: bluetoothStatus.left

			topMargin: 20
			rightMargin: 16
		}
	}
}
