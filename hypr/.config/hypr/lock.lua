local settings = require("settings")

hl.bind(
	settings.hyprland.modifier
		.. " + "
		.. settings.hyprland.keybindings.lock,
	hl.dsp.exec_cmd("hyprlock"),
	{
		description = "Lock session",
	}
)
