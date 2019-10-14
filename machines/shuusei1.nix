{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/common.nix
    ./modules/nix-server.nix
    ./modules/ssh-server.nix
    ./tripokey.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "shuusei1";

  system.stateVersion = "19.03";
}
