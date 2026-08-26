local config = require("config")

hl.bind(
	config.mod .. " + Q",
	hl.dsp.window.close({}),
	{
		description = "Close active window",
	}
)

hl.bind(
	config.mod .. " + SHIFT + E",
	hl.dsp.exit(),
	{
		description = "Exit Hyprland",
	}
)
