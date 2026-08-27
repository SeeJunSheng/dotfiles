local function start_services()
	hl.exec_cmd("fcitx5 -d")
	hl.exec_cmd("hypridle")
end

hl.on("hyprland.start", start_services)
