local settings = require("settings")

for _, monitor in ipairs(settings.hyprland.monitors) do
	hl.monitor(monitor)
end
