import QtQuick
import Quickshell
import Quickshell.Bluetooth
import "../services" as Services

PopupWindow {
	id: root

	readonly property var adapter: Bluetooth.defaultAdapter

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

			Row {
				width: content.width
				spacing: 12

				Text {
					width: parent.width - powerText.width - parent.spacing

					text: root.adapter
						? root.adapter.enabled
							? "Bluetooth ON"
							: "Bluetooth OFF"
						: "Bluetooth unavailable"

					color: Services.Settings.appearanceTextColor
				}

				Text {
					id: powerText

					visible: root.adapter !== null

					text: root.adapter && root.adapter.enabled
						? "Turn Off"
						: "Turn On"

					color: Services.Settings.appearanceTextColor

					MouseArea {
						anchors.fill: parent

						onClicked: {
							if (root.adapter) {
								root.adapter.enabled = !root.adapter.enabled
							}
						}
					}
				}
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
