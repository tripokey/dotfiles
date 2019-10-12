{ config, pkgs, ... }:

{
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleUseXkbConfig = true;
    defaultLocale = "en_US.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    kakoune
    git
    home-manager
  ];

  environment.variables.EDITOR = "kak";

  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";
  services.xserver.xkbVariant = "altgr-intl";

  time.timeZone = "Europe/Stockholm";

  users.users.tripokey = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
}
