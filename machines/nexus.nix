{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/common.nix
    ./modules/nix-client.nix
    ./modules/printer.nix
    ./modules/sound.nix
    ./modules/gnome.nix
    ./modules/bluetooth.nix
    ./tripokey.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nexus";

  services.xserver.libinput.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.displayManager.gdm.wayland = false;

  system.stateVersion = "19.03";
}
