{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.gnome3.enable = true;
    displayManager.gdm.enable = true;
  };
}
