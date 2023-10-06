{ config, pkgs, ... }:

{
  users.users.tripokey = {
    isNormalUser = true;
    extraGroups = [ "wheel" "plugdev" "networkmanager" ];
  };
}
