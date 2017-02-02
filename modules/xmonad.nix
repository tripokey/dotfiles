{ config, lib, pkgs, ... }:

{
  imports = [ ];

  environment.systemPackages = with pkgs; [
    dmenu
  ];

  services.xserver = {
    enable = true;
    windowManager.xmonad.enable = true;
    windowManager.xmonad.enableContribAndExtras = true;
    windowManager.default = "xmonad";
    desktopManager.xterm.enable = false;
    desktopManager.default = "none";
    displayManager = {
      slim = {
        enable = true;
      };
    };
  };
}
