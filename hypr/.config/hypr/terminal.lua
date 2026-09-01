local settings = require("settings")

hl.bind(
	settings.hyprland.modifier
		.. " + "
		.. settings.hyprland.keybindings.terminal,
	hl.dsp.exec_cmd(settings.hyprland.applications.terminal),
	{
		description = "Open terminal",
	}
)
