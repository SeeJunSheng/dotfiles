import QtQuick

CornerPanel {
	id: root

	topEdge: true
	leftEdge: false

	holdOpen: bluetoothStatus.popupVisible

	BluetoothStatus {
		id: bluetoothStatus

		anchors {
			top: parent.top
			right: parent.right

			topMargin: 20
			rightMargin: root.expandedThickness + 12
		}
	}
}
