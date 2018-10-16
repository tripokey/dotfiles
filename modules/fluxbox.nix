{ config, lib, pkgs, ... }:

{
  imports = [ ];

  environment.systemPackages = with pkgs; [
  ];

  services.xserver = {
    enable = true;
    windowManager.fluxbox.enable = true;
    displayManager = {
      slim = {
        enable = true;
      };
    };
  };
}
