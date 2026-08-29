local config = require("config")

hl.bind(
	config.mod .. " + N",
	hl.dsp.focus({ workspace = "emptynm" }),
	{
		description = "Open next empty workspace on current monitor"
	}
)

hl.bind(
	config.mod .. " + Tab",
	hl.dsp.focus({ workspace = "m+1" }),
	{
		description = "Focus next workspace on current monitor"
	}
)
