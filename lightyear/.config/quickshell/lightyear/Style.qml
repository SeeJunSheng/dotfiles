pragma Singleton

import Quickshell
import QtQuick

Singleton {
	readonly property int spacingSmallPreset:
		Settings.appearance.density === "compact" ? 6 :
		Settings.appearance.density === "spacious" ? 10 :
		8

	readonly property int spacingSmall:
		Settings.appearance.spacing.small >= 0
			? Settings.appearance.spacing.small
			: spacingSmallPreset

	readonly property int spacingMediumPreset:
		Settings.appearance.density === "compact" ? 12 :
		Settings.appearance.density === "spacious" ? 20 :
		16

	readonly property int spacingMedium:
		Settings.appearance.spacing.medium >= 0
			? Settings.appearance.spacing.medium
			: spacingMediumPreset

	readonly property int spacingLargePreset:
		Settings.appearance.density === "compact" ? 24 :
		Settings.appearance.density === "spacious" ? 40 :
		32

	readonly property int spacingLarge:
		Settings.appearance.spacing.large >= 0
			? Settings.appearance.spacing.large
			: spacingLargePreset

	readonly property int clockTopMargin:
		Settings.clock.topMargin >= 0
			? Settings.clock.topMargin
			: spacingLarge

	readonly property int fontSizeDisplayPreset:
		Settings.appearance.typography.scale === "small" ? 28 :
		Settings.appearance.typography.scale === "large" ? 36 :
		32

	readonly property int fontSizeDisplay:
		Settings.appearance.typography.large >= 0
			? Settings.appearance.typography.large
			: fontSizeDisplayPreset

	readonly property int clockFontSize:
		Settings.clock.fontSize >= 0
			? Settings.clock.fontSize
			: fontSizeDisplay

	readonly property color textPrimary: "white"
}
