{ config, pkgs, ... }:
let
  wallpaper = (import ../../common/wallpaper.nix);
in
{
  services.xserver = {
    enable = true;
    displayManager.lightdm.background = "${wallpaper}";
  };
}
