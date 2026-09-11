pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
	property alias appearance: adapter.appearance
	property alias clock: adapter.clock

	FileView {
		path: Quickshell.dataPath("settings.json")
		watchChanges: true

		onFileChanged: reload()
		onAdapterUpdated: writeAdapter()

		onLoadFailed: error => {
			if (error === FileViewError.FileNotFound)
				writeAdapter()
		}

		JsonAdapter {
			id: adapter

			property int version: 1

			property JsonObject appearance: JsonObject {
				property string density: "comfortable"

				property JsonObject spacing: JsonObject {
					property int small: -1
					property int medium: -1
					property int large: -1
				}

				property JsonObject typography: JsonObject {
					property string scale: "normal"
					property int display: -1
				}
			}

			property JsonObject clock: JsonObject {
				property bool enabled: true
				property int topMargin: -1
				property int fontSize: -1
			}
		}
	}
}
