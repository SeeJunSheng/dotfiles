local settings = require("settings")

hl.bind(
	settings.hyprland.modifier
		.. " + "
		.. settings.hyprland.keybindings.clipboard,
	hl.dsp.exec_cmd(
		"cliphist list | rofi -dmenu | cliphist decode | wl-copy"
	),
	{
		description = "Open clipboard history",
	}
)
