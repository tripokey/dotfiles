{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./common.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "shuusei1";

  programs.mosh.enable = true;

  services.openssh.enable = true;

  system.stateVersion = "19.03";

  users.extraUsers.nixBuild = {
    name = "nixBuild";
    useDefaultShell = true;
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINWeoa0zBduKGe7xs2zvNz0jLbqFlEpViEQ+QNfYB8wz nixBuild" ];
  };

  nix.trustedUsers = [ "nixBuild" ];
}
