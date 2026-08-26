local config = require("config")

hl.bind(
	config.mod .. " + RETURN",
	hl.dsp.exec_cmd(config.terminal),
	{
		description = "Open terminal",
	}
)
