{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    uhk-udev-rules
    uhk-agent
  ];

  hardware.keyboard.uhk.enable = true;
}

