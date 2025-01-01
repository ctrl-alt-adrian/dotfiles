-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- update fps to make this smoother
-- config.max_fps = 120
config.max_fps = 144
-- For example, changing the color scheme:
config.window_background_opacity = 0.95
config.color_scheme = "Neutron"
config.font = wezterm.font("JetBrainsMono Nerd Font", { style = "Normal" })
config.font_size = 13.5
-- have vim fill up the entire window as possible
config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}
config.window_frame = {
	border_left_width = "0cell",
	border_right_width = "0cell",
	border_bottom_height = "0cell",
	border_top_height = "0cell",
}

config.scrollback_lines = 10000
config.hide_tab_bar_if_only_one_tab = true
config.show_update_window = true
config.window_close_confirmation = "NeverPrompt"
config.use_dead_keys = false
config.use_fancy_tab_bar = true

-- keybinds
config.keys = {
	{
		key = "t",
		mods = "SHIFT|ALT",
		action = act.SpawnTab("DefaultDomain"),
	},
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}
-- and finally, return the configuration to wezterm
return config
