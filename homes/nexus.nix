{ pkgs, ... }:

{
  imports = [
    ./modules/common.nix
    ./modules/graphical.nix
    ./modules/home.nix
    ./modules/gaming.nix
  ];

  services = {
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    pasystray.enable = true;
  };
}
