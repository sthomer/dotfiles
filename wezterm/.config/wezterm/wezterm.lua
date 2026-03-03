local wezterm = require("wezterm")
local config = {}

-- Use config builder if available (newer versions)
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- 🔤 Font
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono",
})
config.font_size = 10
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

-- 🎨 Theme

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "vscode-dark"
	else
		return "vscode-light"
	end
end

config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = scheme_for_appearance(get_appearance())
-- config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.integrated_title_button_alignment = "Left"
config.integrated_title_buttons = { "Close" }

-- 🪟 Window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- ⚡ Performance / Wayland
config.enable_wayland = true
config.front_end = "WebGpu"

config.leader = {
	key = "Space",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

-- 🧩 Tabs & Splits Keybindings
config.keys = {
	-- === Tabs ===
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},

	-- Switch tabs 1-9
	{
		key = "1",
		mods = "LEADER",
		action = wezterm.action.ActivateTab(0),
	},
	{
		key = "2",
		mods = "LEADER",
		action = wezterm.action.ActivateTab(1),
	},
	{
		key = "3",
		mods = "LEADER",
		action = wezterm.action.ActivateTab(2),
	},
	{
		key = "4",
		mods = "LEADER",
		action = wezterm.action.ActivateTab(3),
	},
	{
		key = "5",
		mods = "LEADER",
		action = wezterm.action.ActivateTab(4),
	},

	-- === Splits ===
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Close pane
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	-- === Pane Navigation (Vim style) ===
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	-- === Resize Panes ===
	{
		key = "H",
		mods = "LEADER|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "L",
		mods = "LEADER|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "K",
		mods = "LEADER|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "J",
		mods = "LEADER|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
}

-- 🖱 Better scrollback
config.scrollback_lines = 10000

-- 🧠 Smart tab titles (shows current directory)
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local title = pane.title
	return {
		{ Text = "  " .. title .. "  " },
	}
end)

return config
