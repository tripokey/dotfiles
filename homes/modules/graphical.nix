{ pkgs, ... }:

{
  imports = [
    ./wezterm.nix
    ./firefox.nix
    # ./arandr.nix
  ];
}
