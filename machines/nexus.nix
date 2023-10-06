{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/common.nix
    ./modules/nix-client.nix
    ./modules/printer.nix
    ./modules/sound.nix
    ./modules/x.nix
    ./modules/bluetooth.nix
    ./modules/tripokey.nix
    ./modules/gaming.nix
    ./modules/gnome.nix
    ./modules/uhk.nix
    ./nexus/nvidia_sync.nix
  ];

  environment.systemPackages = with pkgs; [
    firmware-updater
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nexus";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.thermald.enable = true;
  services.fwupd.enable = true;
}
