{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./arandr.nix
  ];
}
