import QtQuick
import Quickshell.Networking
import "../services" as Services

Item {
	id: root

	implicitWidth: networkRow.implicitWidth
	implicitHeight: networkRow.implicitHeight

	Row {
		id: networkRow

		spacing: Services.Settings.statusSpacing

		Repeater {
			model: Networking.devices

			Text {
				required property var modelData

				visible: modelData.connected

				text: DeviceType.toString(modelData.type)
				color: Services.Settings.appearanceTextColor
			}
		}
	}

	MouseArea {
		anchors.fill: networkRow

		onClicked: {
			networkPopup.visible = !networkPopup.visible
		}
	}

	NetworkPopup {
		id: networkPopup

		anchor.item: networkRow
	}
}
