pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
	property alias density: adapter.density

	property alias spacingSmallOverride: adapter.spacingSmallOverride
	property alias spacingMediumOverride: adapter.spacingMediumOverride
	property alias spacingLargeOverride: adapter.spacingLargeOverride

	property alias clockEnabled: adapter.clockEnabled
	property alias clockTopMarginOverride: adapter.clockTopMarginOverride

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

			property string density: "comfortable"

			property int spacingSmallOverride: -1
			property int spacingMediumOverride: -1
			property int spacingLargeOverride: -1

			property bool clockEnabled: true
			property int clockTopMarginOverride: -1
		}
	}
}
