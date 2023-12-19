{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/common.nix
    ./modules/nix-server.nix
    ./modules/ssh-server.nix
    ./modules/tripokey.nix

    <home-manager/nixos>
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "shuusei1";

  home-manager.users.tripokey = { pkgs, ... }: {
    imports = [
      ../homes/shuusei1.nix
    ];

    home.stateVersion = "23.11";
  };

  system.stateVersion = "19.03";
}
