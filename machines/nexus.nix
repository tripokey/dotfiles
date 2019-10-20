{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/common.nix
    ./modules/nix-client.nix
    ./modules/printer.nix
    ./modules/sound.nix
    ./modules/x.nix
    ./modules/bluetooth.nix
    ./modules/tripokey.nix
    ./modules/uhk.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nexus";

  services.xserver.libinput.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  system.stateVersion = "19.03";
}
