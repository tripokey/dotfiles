{ pkgs, ... }:

{
  imports = [
    ./i3.nix
    ./xterm.nix
    ./firefox.nix
    ./arandr.nix
  ];
}
