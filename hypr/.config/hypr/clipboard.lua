local config = require("config")

hl.bind(
	config.mod .. " + V",
	hl.dsp.exec_cmd(
		"cliphist list | rofi -dmenu | cliphist decode | wl-copy"
	),
	{
		description = "Open clipboard history",
	}
)
