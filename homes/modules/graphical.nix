{ pkgs, ... }:

{
  imports = [
    ./wezterm.nix
    ./firefox.nix
  ];
}
