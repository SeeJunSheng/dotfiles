local settings = require("settings")

hl.bind(
	settings.hyprland.modifier
		.. " + "
		.. settings.hyprland.keybindings.emptyWorkspace,
	hl.dsp.focus({ workspace = "emptynm" }),
	{
		description = "Open next empty workspace on current monitor"
	}
)

hl.bind(
	settings.hyprland.modifier
		.. " + "
		.. settings.hyprland.keybindings.nextWorkspace,
	hl.dsp.focus({ workspace = "m+1" }),
	{
		description = "Focus next workspace on current monitor"
	}
)
