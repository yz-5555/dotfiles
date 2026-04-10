local wezterm = require("wezterm")

local rasmus = require("wezterm-rasmus")
local keys = require("wezterm-keymaps")

return {
	colors = rasmus,

	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "DemiBold" }),
	harfbuzz_features = { "cv01", "cv02", "cv03", "cv11", "cv12" },

	font_size = 11.5,
	line_height = 1.1,
	-- freetype_load_flags = "NORMAL",
	freetype_load_target = "Normal",
	freetype_render_target = "HorizontalLcd",

	initial_cols = 120,
	initial_rows = 30,

	default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" },

	hide_tab_bar_if_only_one_tab = true,

	leader = { key = "Space", mods = "ALT" },
	keys = keys,
}