{ pkgs, ... }:

{
  imports = [
    ./modules/common.nix
    ./modules/graphical.nix
    ./modules/home.nix
    ./modules/gaming.nix
  ];
}
