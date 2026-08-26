local monitors = {
	{
		output = "HDMI-A-2",
		mode = "3840x2160@60",
		position = "0x590",
		scale = 1.5,
	},

	{
		output = "DP-4",
		mode = "2560x1440@180",
		position = "2560x590",
		scale = 1,
	},

	{
		output = "DP-3",
		mode = "2560x1440@60",
		position = "5120x0",
		scale = 1,
		transform = 3,
	},
}

for _, monitor in ipairs(monitors) do
	hl.monitor(monitor)
end
