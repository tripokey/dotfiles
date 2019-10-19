{ pkgs, ... }:

{
  imports = [
    ./i3.nix
    ./urxvt.nix
    ./firefox.nix
  ];
}
