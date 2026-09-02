import QtQuick
import Quickshell
import Quickshell.Networking
import "../services" as Services

PopupWindow {
	id: root

	implicitWidth: 300
	implicitHeight: content.implicitHeight + 24

	visible: false
	grabFocus: true

	Rectangle {
		anchors.fill: parent

		color: Services.Settings.barBackgroundColor
		Column {
			id: content

			anchors {
				left: parent.left
				right: parent.right
				top: parent.top
				margins: 12
			}

			spacing: 12

			Text {
				text: "Network"
				color: Services.Settings.appearanceTextColor
			}

			Repeater {
				model: Networking.devices

				Row {
					required property var modelData

					width: content.width
					spacing: 12

					visible: modelData.type === DeviceType.Wired
						&& modelData.connected

					Text {
						width: parent.width - wiredStateText.width - parent.spacing

						text: "Wired"
						color: Services.Settings.appearanceTextColor
					}

					Text {
						id: wiredStateText

						text: "Connected"
						color: Services.Settings.appearanceTextColor
					}
				}
			}

			Row {
				width: content.width
				spacing: 12

				Text {
					width: parent.width - powerText.width - parent.spacing

					text: !Networking.wifiHardwareEnabled
						? "Wi-Fi unavailable"
						: Networking.wifiEnabled
							? "Wi-Fi ON"
							: "Wi-Fi OFF"

					color: Services.Settings.appearanceTextColor
				}

				Text {
					id: powerText

					visible: Networking.wifiHardwareEnabled

					text: Networking.wifiEnabled
						? "Turn Off"
						: "Turn On"

					color: Services.Settings.appearanceTextColor

					MouseArea {
						anchors.fill: parent

						onClicked: {
							Networking.wifiEnabled = !Networking.wifiEnabled
						}
					}
				}
			}
		}
	}
}
