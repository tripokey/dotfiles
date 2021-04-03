{ config, pkgs, lib, ... }:

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

  boot.blacklistedKernelModules = [
    "i2c_nvidia_gpu"
    "tpm_tis"
  ];

  time.hardwareClockInLocalTime = true;

  services.xserver.displayManager.setupCommands = lib.mkAfter ''
    ${pkgs.xorg.xrandr}/bin/xrandr \
      --output DP-4 \
        --mode 2560x1440 \
      --output eDP-1-1 \
        --primary \
        --mode 1920x1080 \
        --right-of DP-4
  '';

  system.stateVersion = "20.09";
}
