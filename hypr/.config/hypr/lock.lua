local config = require("config")

hl.bind(
	config.mod .. " + L",
	hl.dsp.exec_cmd("hyprlock"),
	{
		description = "Lock session",
	}
)
