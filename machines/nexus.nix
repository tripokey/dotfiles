{ config, pkgs, ... }:

{
  nix = {
    distributedBuilds = true;
    buildMachines = [
      {
        hostName = "192.168.158.5";
        sshUser = "nixBuild";
        sshKey = "/root/.ssh/id_nixBuild";
        system = "x86_64-linux";
        maxJobs = 16;
      }
    ];
  };

  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./common.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nexus";

  environment.systemPackages = with pkgs; [
    firefox
  ];

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.enable = true;

  services.xserver.libinput.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = false;

  system.stateVersion = "19.03";
}
