pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
	id: root

	readonly property string configHome: Quickshell.env("XDG_CONFIG_HOME")
		? Quickshell.env("XDG_CONFIG_HOME")
		: Quickshell.env("HOME") + "/.config"

	readonly property string appearanceTextColor:
		settingsAdapter.quickshell.appearance.textColor

	readonly property int barHeight:
		settingsAdapter.quickshell.bar.height

	readonly property string barBackgroundColor:
		settingsAdapter.quickshell.bar.backgroundColor

	readonly property int barOuterMargin:
		settingsAdapter.quickshell.bar.outerMargin

	readonly property int barComponentSpacing:
		settingsAdapter.quickshell.bar.componentSpacing

	readonly property int traySpacing:
		settingsAdapter.quickshell.tray.spacing

	readonly property int trayIconSize:
		settingsAdapter.quickshell.tray.iconSize

	readonly property int workspaceSpacing:
		settingsAdapter.quickshell.workspaces.spacing

	readonly property int workspaceHorizontalPadding:
		settingsAdapter.quickshell.workspaces.horizontalPadding

	readonly property int workspaceHeight:
		settingsAdapter.quickshell.workspaces.height

	readonly property string workspaceFocusedColor:
		settingsAdapter.quickshell.workspaces.focusedColor

	readonly property string workspaceActiveColor:
		settingsAdapter.quickshell.workspaces.activeColor

	readonly property string workspaceInactiveColor:
		settingsAdapter.quickshell.workspaces.inactiveColor

	readonly property real audioVolumeStep:
		settingsAdapter.quickshell.audio.volumeStep

	readonly property string audioMutedLabel:
		settingsAdapter.quickshell.audio.mutedLabel

	readonly property string audioUnavailableLabel:
		settingsAdapter.quickshell.audio.unavailableLabel

	readonly property string clockFormat:
		settingsAdapter.quickshell.clock.format

	readonly property int statusSpacing:
		settingsAdapter.quickshell.status.spacing

	readonly property string bluetoothEnabledLabel:
		settingsAdapter.quickshell.bluetooth.enabledLabel

	readonly property string bluetoothDisabledLabel:
		settingsAdapter.quickshell.bluetooth.disabledLabel

	readonly property string bluetoothUnavailableLabel:
		settingsAdapter.quickshell.bluetooth.unavailableLabel

	readonly property int bluetoothPopupWidth:
		settingsAdapter.quickshell.bluetooth.popup.width

	readonly property int bluetoothPopupPadding:
		settingsAdapter.quickshell.bluetooth.popup.padding

	readonly property int bluetoothPopupSectionSpacing:
		settingsAdapter.quickshell.bluetooth.popup.sectionSpacing

	readonly property int bluetoothPopupRowSpacing:
		settingsAdapter.quickshell.bluetooth.popup.rowSpacing

	readonly property int bluetoothScanTimeoutMs:
		settingsAdapter.quickshell.bluetooth.popup.scanTimeoutMs

	readonly property string bluetoothPopupEnabledLabel:
		settingsAdapter.quickshell.bluetooth.popup.enabledLabel

	readonly property string bluetoothPopupDisabledLabel:
		settingsAdapter.quickshell.bluetooth.popup.disabledLabel

	readonly property string bluetoothPopupUnavailableLabel:
		settingsAdapter.quickshell.bluetooth.popup.unavailableLabel

	readonly property string bluetoothTurnOnLabel:
		settingsAdapter.quickshell.bluetooth.popup.turnOnLabel

	readonly property string bluetoothTurnOffLabel:
		settingsAdapter.quickshell.bluetooth.popup.turnOffLabel

	readonly property string bluetoothDevicesLabel:
		settingsAdapter.quickshell.bluetooth.popup.devicesLabel

	readonly property string bluetoothScanLabel:
		settingsAdapter.quickshell.bluetooth.popup.scanLabel

	readonly property string bluetoothStopScanLabel:
		settingsAdapter.quickshell.bluetooth.popup.stopScanLabel

	readonly property string bluetoothConnectLabel:
		settingsAdapter.quickshell.bluetooth.popup.connectLabel

	readonly property string bluetoothDisconnectLabel:
		settingsAdapter.quickshell.bluetooth.popup.disconnectLabel

	readonly property string bluetoothPairLabel:
		settingsAdapter.quickshell.bluetooth.popup.pairLabel

	FileView {
		id: settingsFile

		path: root.configHome + "/callisto/settings.json"
		blockLoading: true
		watchChanges: true

		onFileChanged: reload()

		JsonAdapter {
			id: settingsAdapter

			property int schemaVersion: 1

			property JsonObject quickshell: JsonObject {
				property JsonObject appearance: JsonObject {
					property string textColor: "white"
				}

				property JsonObject bar: JsonObject {
					property int height: 36
					property string backgroundColor: "#202020"
					property int outerMargin: 12
					property int componentSpacing: 12
				}

				property JsonObject tray: JsonObject {
					property int spacing: 6
					property int iconSize: 18
				}

				property JsonObject workspaces: JsonObject {
					property int spacing: 8
					property int horizontalPadding: 8
					property int height: 24
					property string focusedColor: "white"
					property string activeColor: "#bbbbbb"
					property string inactiveColor: "#666666"
				}

				property JsonObject audio: JsonObject {
					property real volumeStep: 0.05
					property string mutedLabel: "MUTE"
					property string unavailableLabel: "--"
				}

				property JsonObject clock: JsonObject {
					property string format: "hh:mm"
				}

				property JsonObject status: JsonObject {
					property int spacing: 4
				}

				property JsonObject bluetooth: JsonObject {
					property string enabledLabel
					property string disabledLabel
					property string unavailableLabel

					property JsonObject popup: JsonObject {
						property int width
						property int padding
						property int sectionSpacing
						property int rowSpacing
						property int scanTimeoutMs

						property string enabledLabel
						property string disabledLabel
						property string unavailableLabel
						property string turnOnLabel
						property string turnOffLabel
						property string devicesLabel
						property string scanLabel
						property string stopScanLabel
						property string connectLabel
						property string disconnectLabel
						property string pairLabel
					}
				}
			}
		}
	}
}
