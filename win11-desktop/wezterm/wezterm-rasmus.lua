return {
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