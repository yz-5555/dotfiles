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
local resize_pane = {
	{ key = "LeftArrow",  action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "h",          action = act.AdjustPaneSize({ "Left", 1 }) },

	{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "l",          action = act.AdjustPaneSize({ "Right", 1 }) },

	{ key = "UpArrow",    action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "k",          action = act.AdjustPaneSize({ "Up", 1 }) },

	{ key = "DownArrow",  action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "j",          action = act.AdjustPaneSize({ "Down", 1 }) },

	-- Cancel the mode by pressing escape
	{ key = "Escape",     action = "PopKeyTable" },
}
local activate_pane = {
	{ key = "LeftArrow",  action = act.ActivatePaneDirection("Left") },
	{ key = "h",          action = act.ActivatePaneDirection("Left") },

	{ key = "RightArrow", action = act.ActivatePaneDirection("Right") },
	{ key = "l",          action = act.ActivatePaneDirection("Right") },

	{ key = "UpArrow",    action = act.ActivatePaneDirection("Up") },
	{ key = "k",          action = act.ActivatePaneDirection("Up") },

	{ key = "DownArrow",  action = act.ActivatePaneDirection("Down") },
	{ key = "j",          action = act.ActivatePaneDirection("Down") },
}
local keys = {
	{
		key = "c",
		mods = "LEADER",
		action = act.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "LEADER",
		action = act.PasteFrom("Clipboard"),
	},
	{
		key = "t",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "d",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
	{
		key = "a",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "activate_pane",
			timeout_milliseconds = 1000,
		}),
	},
}
local add_activate_tab = function(keys)
	for i = 1, 8 do
		-- CTRL+ALT + number to activate that tab
		table.insert(keys, {
			key = tostring(i),
			mods = "LEADER",
			action = act.ActivateTab(i - 1),
		})
	end
end

add_activate_tab(keys)

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
	key_tables = {
		resize_pane = resize_pane,
		activate_pane = activate_pane,
	},
	keys = keys,
}
