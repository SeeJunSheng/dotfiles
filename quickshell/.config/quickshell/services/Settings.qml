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
					property string enabledLabel: "BT"
					property string disabledLabel: "BT OFF"
					property string unavailableLabel: "NO BT"
				}
			}
		}
	}
}
