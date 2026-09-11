pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
	property alias clockEnabled: adapter.clockEnabled
	property alias density: adapter.density

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
			property bool clockEnabled: true
			property string density: "comfortable"
		}
	}
}
