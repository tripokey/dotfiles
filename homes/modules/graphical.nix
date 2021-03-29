{ pkgs, ... }:

{
  imports = [
    ./i3.nix
    ./alacritty.nix
    ./firefox.nix
    ./arandr.nix
  ];
}
