local settings = require("settings")

hl.bind(
	settings.hyprland.keybindings.screenshot,
	hl.dsp.exec_cmd([[grim -g "$(slurp -d)" - | wl-copy]]),
	{
		description = "Screenshot region to clipboard",
	}
)
