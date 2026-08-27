local config = require("config")

hl.bind(
	config.mod .. " + Q",
	hl.dsp.window.close({}),
	{
		description = "Close active window",
	}
)

hl.bind(
	config.mod .. " + F",
	hl.dsp.window.fullscreen({
		mode = "fullscreen",
		action = "toggle",
	}),
	{
		description = "Toggle fullscreen",
	}
)

hl.bind(
	config.mod .. " + M",
	hl.dsp.window.fullscreen({
		mode = "maximized",
		action = "toggle",
	}),
	{
		description = "Toggle maximized",
	}
)

hl.bind(
	config.mod .. " + SHIFT + E",
	hl.dsp.exit(),
	{
		description = "Exit Hyprland",
	}
)
