local function start_services()
	hl.exec_cmd("fcitx5 -d")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("wl-paste --watch cliphist store")
end

hl.on("hyprland.start", start_services)
