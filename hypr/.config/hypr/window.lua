local settings = require("settings")

hl.bind(
	settings.hyprland.modifier
		.. " + "
		.. settings.hyprland.keybindings.closeWindow,
	hl.dsp.window.close({}),
	{
		description = "Close active window",
	}
)

hl.bind(
	settings.hyprland.modifier
		.. " + "
		.. settings.hyprland.keybindings.fullscreen,
	hl.dsp.window.fullscreen({
		mode = "fullscreen",
		action = "toggle",
	}),
	{
		description = "Toggle fullscreen",
	}
)

hl.bind(
	settings.hyprland.modifier
		.. " + "
		.. settings.hyprland.keybindings.maximize,
	hl.dsp.window.fullscreen({
		mode = "maximized",
		action = "toggle",
	}),
	{
		description = "Toggle maximized",
	}
)

hl.bind(
	settings.hyprland.modifier
		.. " + "
		.. settings.hyprland.keybindings.exit,
	hl.dsp.exit(),
	{
		description = "Exit Hyprland",
	}
)
