{ config, lib, pkgs, ... }:

{
  imports = [ ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull
    unzip
    manpages
  ];

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  services.nixosManual.showManual = true;

  security.sudo.enable = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";
}
