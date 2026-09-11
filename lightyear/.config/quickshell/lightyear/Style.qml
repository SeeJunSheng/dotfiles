pragma Singleton

import Quickshell
import QtQuick

Singleton {
	readonly property int spacingSmall:
		Settings.density === "compact" ? 6 :
		Settings.density === "spacious" ? 10 :
		8

	readonly property int spacingMedium:
		Settings.density === "compact" ? 12 :
		Settings.density === "spacious" ? 20 :
		16

	readonly property int spacingLarge:
		Settings.density === "compact" ? 24 :
		Settings.density === "spacious" ? 40 :
		32

	readonly property int clockFontSize: 32
	readonly property color textPrimary: "white"
}
