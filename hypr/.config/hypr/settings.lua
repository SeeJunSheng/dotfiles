local json = require("dkjson")

local config_home = os.getenv("XDG_CONFIG_HOME")

if not config_home or config_home == "" then
	local home = os.getenv("HOME")

	if not home or home == "" then
		error("Could not determine Callisto config path: HOME is not set")
	end

	config_home = home .. "/.config"
end

local settings_path = config_home .. "/callisto/settings.json"

local file, open_error = io.open(settings_path, "r")

if not file then
	error(
		"Failed to open Callisto settings at "
		.. settings_path
		.. ": "
		.. tostring(open_error)
	)
end

local contents, read_error = file:read("*a")
file:close()

if not contents then
	error(
		"Failed to read Callisto settings at "
		.. settings_path
		.. ": "
		.. tostring(read_error)
	)
end

local settings, _, decode_error = json.decode(contents)

if decode_error then
	error(
		"Failed to decode Callisto settings at "
		.. settings_path
		.. ": "
		.. decode_error
	)
end

return settings
