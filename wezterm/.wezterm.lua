local wezterm = require("wezterm")
local act = wezterm.action
local rasmus = {
	foreground = "#d1d1d1", -- Foreground (fg)
	background = "#1a1a19", -- Background (bg)
	cursor_bg = "#d1d1d1",  -- Cursor background
	cursor_border = "#d1d1d1", -- Cursor border
	cursor_fg = "#1a1a19",  -- Cursor foreground
	selection_bg = "#3a3a39", -- Selection background (gray04)
	selection_fg = "#d1d1d1", -- Selection foreground

	-- ANSI (Normal)
	ansi = {
		"#333332", -- black
		"#ff968c", -- red
		"#61957f", -- green
		"#ffc591", -- yellow
		"#8db4d4", -- blue
		"#de9bc8", -- magenta
		"#7bb099", -- cyan
		"#d1d1d1", -- white
	},

	-- Bright colors
	brights = {
		"#4c4c4b", -- bright_black
		"#ffafa5", -- bright_red
		"#7aae98", -- bright_green
		"#ffdeaa", -- bright_yellow
		"#a6cded", -- bright_blue
		"#f7b4e1", -- bright_magenta
		"#94c9b2", -- bright_cyan
		"#eaeaea", -- bright_white
	},

	-- Tab bar customization
	tab_bar = {
		background = "#222221", -- gray01
		active_tab = {
			bg_color = "#2a2a29", -- gray02
			fg_color = "#d1d1d1", -- fg
		},
		inactive_tab = {
			bg_color = "#323231", -- gray03
			fg_color = "#767675", -- gray06
		},
		inactive_tab_hover = {
			bg_color = "#3a3a39", -- gray04
			fg_color = "#b6b6b5", -- gray07
			italic = true,
		},
	},
}
local keys = {
	{
		key = "c",
		mods = "ALT",
		action = act.CopyTo("Clipboard"),
	},
	{
		key = "p",
		mods = "ALT",
		action = act.PasteFrom("Clipboard"),
	},
	{
		key = "t",
		mods = "ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "d",
		mods = "ALT",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "v",
		mods = "ALT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "ALT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

return {
	colors = rasmus,

	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "DemiBold" }),
	harfbuzz_features = { "cv01", "cv03", "cv02", "cv11" },

	font_size = 12.5,
	line_height = 1.1,
	-- freetype_load_flags = "NORMAL",
	freetype_load_target = "Light",
	freetype_render_target = "HorizontalLcd",

	initial_cols = 120,
	initial_rows = 30,

	default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" },

	hide_tab_bar_if_only_one_tab = true,

	keys = keys,
}
