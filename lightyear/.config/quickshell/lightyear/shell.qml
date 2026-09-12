//@ pragma DataDir $BASE/lightyear

import Quickshell

ShellRoot {
	GlobalRoot {
		id: global
	}

	Variants {
		model: Quickshell.screens

		ScreenRoot {
			audioService: global.audioService
			networkingService: global.networkingService
			bluetoothService: global.bluetoothService
		}
	}
}
