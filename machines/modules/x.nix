{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    libinput.enable = true;
  };
}
