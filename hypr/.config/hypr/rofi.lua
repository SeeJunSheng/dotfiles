local settings = require("settings")

hl.bind(
	settings.hyprland.modifier
		.. " + "
		.. settings.hyprland.keybindings.launcher,
	hl.dsp.exec_cmd("rofi -show drun"),
	{
		description = "Open application launcher",
	}
)
