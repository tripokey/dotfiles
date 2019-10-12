{ config, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nexus";

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleUseXkbConfig = true;
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Stockholm";

  environment.systemPackages = with pkgs; [
    kakoune
    home-manager
  ];

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";
  services.xserver.xkbVariant = "altgr-intl";

  services.xserver.libinput.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = false;

  users.users.tripokey = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "19.03"; 
}
