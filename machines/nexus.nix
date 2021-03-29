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
    # ./nexus/nvidia_offload.nix
    ./nexus/nvidia_sync.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nexus";
  networking.networkmanager.enable = true;

  services.xserver.libinput.enable = true;

  boot.blacklistedKernelModules = [ "i2c_nvidia_gpu" ];

  time.hardwareClockInLocalTime = true;

  system.stateVersion = "20.09";
}
