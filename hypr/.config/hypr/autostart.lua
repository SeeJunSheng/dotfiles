local function start_services()
        hl.exec_cmd("fcitx5 -d")
end

hl.on("hyprland.start", start_services)
