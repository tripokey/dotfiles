{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    dpi = 220;
  };
}
