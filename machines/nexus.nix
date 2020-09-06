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
    ./modules/gaming.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nexus";
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp0s20f0u1.useDHCP = true;
  networking.interfaces.enp4s0.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  services.xserver.libinput.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  time.hardwareClockInLocalTime = true;

  system.stateVersion = "20.03";
}
