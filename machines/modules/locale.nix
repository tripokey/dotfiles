{ config, pkgs, ... }:

{
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  services.xserver.layout = "us";

  time.timeZone = "Europe/Stockholm";
}
