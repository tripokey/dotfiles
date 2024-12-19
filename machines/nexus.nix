{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/common.nix
    ./modules/bluetooth.nix
    ./modules/tripokey.nix
    ./modules/gaming.nix
    ./modules/uhk.nix
  ];

  environment.systemPackages = with pkgs; [
    firmware-updater
  ];

  services.thermald.enable = true;
  services.fwupd.enable = true;
}
