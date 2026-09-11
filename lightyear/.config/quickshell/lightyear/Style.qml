pragma Singleton

import Quickshell
import QtQuick

Singleton {
	readonly property int spacingSmallPreset:
		Settings.density === "compact" ? 6 :
		Settings.density === "spacious" ? 10 :
		8

	readonly property int spacingSmall:
		Settings.spacingSmallOverride >= 0
			? Settings.spacingSmallOverride
			: spacingSmallPreset

	readonly property int spacingMediumPreset:
		Settings.density === "compact" ? 12 :
		Settings.density === "spacious" ? 20 :
		16

	readonly property int spacingMedium:
		Settings.spacingMediumOverride >= 0
			? Settings.spacingMediumOverride
			: spacingMediumPreset

	readonly property int spacingLargePreset:
		Settings.density === "compact" ? 24 :
		Settings.density === "spacious" ? 40 :
		32

	readonly property int spacingLarge:
		Settings.spacingLargeOverride >= 0
			? Settings.spacingLargeOverride
			: spacingLargePreset

	readonly property int clockTopMargin:
		Settings.clockTopMarginOverride >= 0
			? Settings.clockTopMarginOverride
			: spacingLarge

	readonly property int clockFontSize: 32
	readonly property color textPrimary: "white"
}
