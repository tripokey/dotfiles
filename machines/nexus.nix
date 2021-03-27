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
    ./modules/tripokey.nix
    ./modules/uhk.nix
    ./modules/gaming.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nexus";
  networking.networkmanager.enable = true;

  services.xserver.libinput.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource modesetting NVIDIA-0
    ${pkgs.xorg.xrandr}/bin/xrandr --auto
  '';
  boot.blacklistedKernelModules = [ "i2c_nvidia_gpu" ];

  time.hardwareClockInLocalTime = true;

  system.stateVersion = "20.09";
}
