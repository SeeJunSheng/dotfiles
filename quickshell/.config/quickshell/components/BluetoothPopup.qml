import QtQuick
import Quickshell
import Quickshell.Bluetooth
import "../services" as Services

PopupWindow {
	id: root

	readonly property var adapter: Bluetooth.defaultAdapter

	implicitWidth: Services.Settings.bluetoothPopupWidth
	implicitHeight: content.implicitHeight
		+ Services.Settings.bluetoothPopupPadding * 2

	visible: false
	grabFocus: true

	Timer {
		id: scanTimer

		interval: Services.Settings.bluetoothScanTimeoutMs
		repeat: false

		onTriggered: {
			if (root.adapter && root.adapter.discovering) {
				root.adapter.discovering = false
			}
		}
	}

	onVisibleChanged: {
		if (!visible) {
			scanTimer.stop()

			if (root.adapter && root.adapter.discovering) {
				root.adapter.discovering = false
			}
		}
	}

	Rectangle {
		anchors.fill: parent

		color: Services.Settings.barBackgroundColor

		Column {
			id: content

			anchors {
				left: parent.left
				right: parent.right
				top: parent.top
				margins: Services.Settings.bluetoothPopupPadding
			}

			spacing: Services.Settings.bluetoothPopupSectionSpacing

			Row {
				width: content.width
				spacing: Services.Settings.bluetoothPopupRowSpacing

				Text {
					width: parent.width - powerText.width - parent.spacing

					text: root.adapter
						? root.adapter.enabled
							? Services.Settings.bluetoothPopupEnabledLabel
							: Services.Settings.bluetoothPopupDisabledLabel
						: Services.Settings.bluetoothPopupUnavailableLabel

					color: Services.Settings.appearanceTextColor
				}

				Text {
					id: powerText

					visible: root.adapter !== null

					text: root.adapter && root.adapter.enabled
						? Services.Settings.bluetoothTurnOffLabel
						: Services.Settings.bluetoothTurnOnLabel

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

			Row {
				width: content.width
				spacing: Services.Settings.bluetoothPopupRowSpacing

				Text {
					width: parent.width - scanText.width - parent.spacing

					text: Services.Settings.bluetoothDevicesLabel
					color: Services.Settings.appearanceTextColor
				}

				Text {
					id: scanText

					visible: root.adapter && root.adapter.enabled

					text: root.adapter && root.adapter.discovering
						? Services.Settings.bluetoothStopScanLabel
						: Services.Settings.bluetoothScanLabel

					color: Services.Settings.appearanceTextColor

					MouseArea {
						anchors.fill: parent

						onClicked: {
							if (!root.adapter || !root.adapter.enabled) {
								return
							}

							if (root.adapter.discovering) {
								root.adapter.discovering = false
								scanTimer.stop()
							} else {
								root.adapter.discovering = true
								scanTimer.restart()
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
					spacing: Services.Settings.bluetoothPopupRowSpacing

					visible: root.adapter
						&& (
							root.adapter.discovering
							|| modelData.paired
							|| modelData.trusted
							|| modelData.connected
						)

					Text {
						width: parent.width - actionText.width - parent.spacing

						text: modelData.name
						color: Services.Settings.appearanceTextColor
					}

					Text {
						id: actionText

						text: modelData.connected
							? Services.Settings.bluetoothDisconnectLabel
							: modelData.paired
								? Services.Settings.bluetoothConnectLabel
								: Services.Settings.bluetoothPairLabel

						color: Services.Settings.appearanceTextColor

						MouseArea {
							anchors.fill: parent

							onClicked: {
								if (modelData.connected) {
									modelData.disconnect()
								} else if (modelData.paired) {
									modelData.connect()
								} else {
									modelData.pair()
								}
							}
						}
					}
				}
			}
		}
	}
}
