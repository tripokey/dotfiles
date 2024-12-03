local wezterm = require 'wezterm';

return {
    front_end = "WebGpu",
    enable_wayland = false,
    color_scheme = "Gruvbox Light",
    
    tab_bar_at_bottom = true,

    default_prog = { 'nu', '-l' },

    -- Workaround for mouse cursor not automatically appearing when mouse is moved
    hide_mouse_cursor_when_typing = false,

    leader = { key="a", mods="CTRL" },
    keys = {
          {key="|", mods="LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
          {key="-", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
          {key="c", mods="LEADER", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
          {key="1", mods="LEADER", action=wezterm.action{ActivateTab=0}},
          {key="2", mods="LEADER", action=wezterm.action{ActivateTab=1}},
          {key="3", mods="LEADER", action=wezterm.action{ActivateTab=2}},
          {key="4", mods="LEADER", action=wezterm.action{ActivateTab=3}},
          {key="5", mods="LEADER", action=wezterm.action{ActivateTab=4}},
          {key="6", mods="LEADER", action=wezterm.action{ActivateTab=5}},
          {key="7", mods="LEADER", action=wezterm.action{ActivateTab=6}},
          {key="8", mods="LEADER", action=wezterm.action{ActivateTab=7}},
          {key="9", mods="LEADER", action=wezterm.action{ActivateTab=8}},
          {key="h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
          {key="j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
          {key="k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
          {key="l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},
          {key="h", mods="LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left",5}}},
          {key="j", mods="LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down",5}}},
          {key="k", mods="LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up",5}}},
          {key="l", mods="LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right",5}}},
          {key="Escape", mods="LEADER", action="ActivateCopyMode"},
          {key="y", mods="LEADER", action=wezterm.action{CopyTo="Clipboard"}},
          {key="p", mods="LEADER", action=wezterm.action{PasteFrom="Clipboard"}},
          {key="f", mods="LEADER", action="TogglePaneZoomState"},
          {key="a", mods="LEADER|CTRL", action=wezterm.action{SendString="\x01"}},
    },
}
