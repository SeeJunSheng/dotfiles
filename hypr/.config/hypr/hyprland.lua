local mod = "SUPER"

-- Displays

hl.monitor({
	output = "HDMI-A-2",
	mode = "3840x2160@60",
	position = "0x590",
	scale = 1.5,
})

hl.monitor({
	output = "DP-4",
	mode = "2560x1440@180",
	position = "2560x590",
	scale = 1,
})

hl.monitor({
	output = "DP-3",
	mode = "2560x1440@60",
	position = "5120x0",
	scale = 1,
	transform = 3,
})

-- Applications

hl.bind(
	mod .. " + RETURN",
	hl.dsp.exec_cmd("kitty"),
	{
		description = "Open terminal",
	}
)

hl.bind(
	mod .. " + D",
	hl.dsp.exec_cmd("rofi -show drun"),
	{
		description = "Open application launcher",
	}
)

hl.bind(
	mod .. " + V",
	hl.dsp.exec_cmd(
		"cliphist list | rofi -dmenu | cliphist decode | wl-copy"
	),
	{
		description = "Open clipboard history",
	}
)

-- Windows

hl.bind(
	mod .. " + Q",
	hl.dsp.window.close({}),
	{
		description = "Close active window",
	}
)

hl.bind(
	mod .. " + F",
	hl.dsp.window.fullscreen({
		mode = "fullscreen",
		action = "toggle",
	}),
	{
		description = "Toggle fullscreen",
	}
)

hl.bind(
	mod .. " + M",
	hl.dsp.window.fullscreen({
		mode = "maximized",
		action = "toggle",
	}),
	{
		description = "Toggle maximized",
	}
)

-- Workspaces

hl.bind(
	mod .. " + N",
	hl.dsp.focus({
		workspace = "emptynm",
	}),
	{
		description = "Open next empty workspace on current monitor",
	}
)

hl.bind(
	mod .. " + Tab",
	hl.dsp.focus({
		workspace = "m+1",
	}),
	{
		description = "Focus next workspace on current monitor",
	}
)

-- Utilities

hl.bind(
	"Print",
	hl.dsp.exec_cmd([[grim -g "$(slurp -d)" - | wl-copy]]),
	{
		description = "Screenshot region to clipboard",
	}
)

hl.bind(
	mod .. " + P",
	hl.dsp.global("lightyear:raisePanels"),
	{
		description = "Raise Lightyear panels",
	}
)

hl.bind(
	mod .. " + L",
	hl.dsp.exec_cmd("hyprlock"),
	{
		description = "Lock session",
	}
)

hl.bind(
	mod .. " + SHIFT + E",
	hl.dsp.exit(),
	{
		description = "Exit Hyprland",
	}
)

-- Startup

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("qs -c lightyear")
	hl.exec_cmd("fcitx5 -d")
	hl.exec_cmd("hypridle")
end)

-- Shutdown

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)
