{ config, lib, pkgs, ... }:

{
  imports = [ ];

  environment.systemPackages = with pkgs; [
  ];

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    windowManager.default = "i3";
    desktopManager.xterm.enable = false;
    desktopManager.default = "none";
    displayManager = {
      slim = {
        enable = true;
      };
    };
  };
}
