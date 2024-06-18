{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.libinput.enable = true;
}
