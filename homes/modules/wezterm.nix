{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      wezterm
    ];

    file.weztermconfig = {
      source = ../../wezterm.lua;
      target = ".config/wezterm/wezterm.lua";
    };
  };
}
