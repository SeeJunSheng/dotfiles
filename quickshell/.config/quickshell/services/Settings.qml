pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
	id: root

	readonly property string configHome: Quickshell.env("XDG_CONFIG_HOME")
		? Quickshell.env("XDG_CONFIG_HOME")
		: Quickshell.env("HOME") + "/.config"

	readonly property int barHeight: settingsAdapter.quickshell.bar.height

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
				property JsonObject bar: JsonObject {
					property int height: 36
				}
			}
		}
	}
}
