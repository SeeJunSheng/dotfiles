local config = require("config")

hl.bind(
	config.mod .. " + D",
	hl.dsp.exec_cmd("rofi -show drun"),
	{
		description = "Open application launcher",
	}
)
