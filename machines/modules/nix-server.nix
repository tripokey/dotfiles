{ config, pkgs, ... }:

{
  users.extraUsers.nixBuild = {
    name = "nixBuild";
    group = "nixBuild";
    useDefaultShell = true;
    isSystemUser = true;
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKcgutTsg+gZDuOrfZlkWmsoZsvQ/RW+MkZSWsni+VZt nixBuild" ];
  };

  users.groups.nixBuild = {};

  nix.settings.trusted-users = [ "nixBuild" ];
}
