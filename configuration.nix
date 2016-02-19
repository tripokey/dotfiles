# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  swapDevices = [ { device = "/dev/sda5"; } ];

  networking.hostName = "nexus"; # Define your hostname.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vimHugeX sudo
    gitAndTools.gitFull
    tmux
    dmenu
    firefoxWrapper
    silver-searcher
    xclip
    terminus_font
    ghc cabal-install
  ];

  programs.zsh.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us,se";
    xkbOptions = "grp:caps_toggle";
    windowManager.xmonad.enable = true;
    windowManager.xmonad.enableContribAndExtras = true;
    windowManager.default = "xmonad";
    desktopManager.xterm.enable = false;
    desktopManager.default = "none";
    displayManager = {
      slim = {
        enable = true;
        defaultUser = "tripokey";
	autoLogin = true;
      };
    };
  };

  services.nixosManual.showManual = true;

  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  users.extraUsers.tripokey = {
    createHome = true;
    home = "/home/tripokey";
    description = "Michael Leandersson";
    extraGroups = [ "wheel" "disk" "vboxusers" "cdrom" ];
    isSystemUser = false;
    useDefaultShell = true;
  };

  security.sudo.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";
  
  virtualisation.virtualbox.guest.enable = true;
}
