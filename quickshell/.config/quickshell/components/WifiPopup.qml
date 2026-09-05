import QtQuick
import Quickshell
import Quickshell.Networking
import "../services" as Services

PopupWindow {
	id: root

	implicitWidth: Services.Settings.wifiPopupWidth
	implicitHeight: content.implicitHeight
		+ Services.Settings.wifiPopupPadding * 2

	visible: false
	grabFocus: true

	Rectangle {
		anchors.fill: parent

		color: Services.Settings.wifiPopupBackgroundColor

		Column {
			id: content

			anchors {
				left: parent.left
				right: parent.right
				top: parent.top
				margins: Services.Settings.wifiPopupPadding
			}

			Row {
				width: content.width
				spacing: Services.Settings.wifiPopupRowSpacing

				Text {
					width: powerText.visible
						? parent.width - powerText.width - parent.spacing
						: parent.width

					text: !Networking.wifiHardwareEnabled
						? Services.Settings.wifiPopupUnavailableLabel
						: Networking.wifiEnabled
							? Services.Settings.wifiPopupEnabledLabel
							: Services.Settings.wifiPopupDisabledLabel

					color: Services.Settings.appearanceTextColor
				}

				Text {
					id: powerText

					visible: Networking.wifiHardwareEnabled

					text: Networking.wifiEnabled
						? Services.Settings.wifiTurnOffLabel
						: Services.Settings.wifiTurnOnLabel

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
