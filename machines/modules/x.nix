{ config, pkgs, ... }:
let
  wallpaper = (import ../../common/wallpaper.nix);
in
{
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable=true;
    displayManager.lightdm.background = "${wallpaper}";
  };
}
