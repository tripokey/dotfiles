{ config, pkgs, ... }:

{
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleUseXkbConfig = true;
    defaultLocale = "en_US.UTF-8";
  };

  services.xserver.layout = "us";

  time.timeZone = "Europe/Stockholm";
}
