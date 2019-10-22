{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = true;

  hardware.bluetooth.extraConfig = "
    [General]
    Enable=Source,Sink,Media,Socket
  ";

  hardware.pulseaudio = {
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;
  };

  services.dbus.packages = [ pkgs.blueman ];
  services.blueman.enable = true;
}
