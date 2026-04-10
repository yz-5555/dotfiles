local act = require("wezterm").action

local add_keymaps = function(keys, keymaps)
	for i = 1, #keymaps do
		table.insert(keys, keymaps[i])
	end
end
local add_activate_tab = function(keys)
	for i = 1, 8 do
		table.insert(keys, {
			key = tostring(i),
			mods = "ALT",
			action = act.ActivateTab(i - 1),
		})
	end
end

local clipboard = {
	{ key = "c", mods = "ALT", action = act.CopyTo("Clipboard") },
	{ key = "p", mods = "ALT", action = act.PasteFrom("Clipboard") },
}
local manage_pane = {
	{ key = "-",  mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "q",   mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
}
local resize_pane = {
	{ key = "h", mods = "ALT", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "l", mods = "ALT", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "k", mods = "ALT", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "j", mods = "ALT", action = act.AdjustPaneSize({ "Down", 1 }) },
}
local activate_pane = {
	{ key = "LeftArrow",  mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow",    mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow",  mods = "ALT", action = act.ActivatePaneDirection("Down") },
}
local manage_tab = {
	{ key = "t", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "d", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
}

local keys = {}
add_keymaps(keys, clipboard)

add_keymaps(keys, manage_pane)
add_keymaps(keys, resize_pane)
add_keymaps(keys, activate_pane)

add_keymaps(keys, manage_tab)
add_activate_tab(keys)

return keys