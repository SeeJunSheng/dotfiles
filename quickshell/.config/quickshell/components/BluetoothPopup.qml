import QtQuick
import Quickshell
import Quickshell.Bluetooth
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
				text: Bluetooth.defaultAdapter
					? Bluetooth.defaultAdapter.enabled
						? "Bluetooth ON"
						: "Bluetooth OFF"
					: "Bluetooth unavailable"

				color: Services.Settings.appearanceTextColor
			}

			Repeater {
				model: Bluetooth.devices

				Row {
					required property var modelData

					width: content.width
					spacing: 12

					Text {
						width: parent.width - actionText.width - parent.spacing

						text: modelData.name
						color: Services.Settings.appearanceTextColor
					}

					Text {
						id: actionText

						text: modelData.connected
							? "Disconnect"
							: "Connect"

						color: Services.Settings.appearanceTextColor

						MouseArea {
							anchors.fill: parent

							onClicked: {
								if (modelData.connected) {
									modelData.disconnect()
								} else {
									modelData.connect()
								}
							}
						}
					}
				}
			}
		}
	}
}
