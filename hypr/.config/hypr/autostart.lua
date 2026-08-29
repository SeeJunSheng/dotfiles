local function start_services()
	hl.exec_cmd("fcitx5 -d")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("systemctl --user start hyprpolkitagent.service")
	hl.exec_cmd("qs")
end

hl.on("hyprland.start", start_services)
