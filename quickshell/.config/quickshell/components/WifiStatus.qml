import QtQuick
import Quickshell.Networking
import "../services" as Services

Item {
	id: root

	readonly property bool popupVisible: wifiPopup.visible

	implicitWidth: wifiIcon.implicitWidth
	implicitHeight: wifiIcon.implicitHeight

	Text {
		id: wifiIcon

		text: Services.Settings.wifiIcon

		font.family: Services.Settings.iconFontFamily
		font.pixelSize: Services.Settings.wifiIconSize

		color: Services.Settings.appearanceTextColor
		opacity: Networking.wifiHardwareEnabled
			&& Networking.wifiEnabled
				? 1.0
				: Services.Settings.wifiDisabledOpacity
	}

	MouseArea {
		anchors.fill: wifiIcon

		onClicked: {
			wifiPopup.visible = !wifiPopup.visible
		}
	}

	WifiPopup {
		id: wifiPopup

		anchor.item: wifiIcon
	}
}
