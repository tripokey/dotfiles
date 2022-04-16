{ config, pkgs, ... }:

{
  users.extraUsers.nixBuild = {
    name = "nixBuild";
    group = "nixBuild";
    useDefaultShell = true;
    isSystemUser = true;
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINWeoa0zBduKGe7xs2zvNz0jLbqFlEpViEQ+QNfYB8wz nixBuild" ];
  };

  users.groups.nixBuild = {};

  nix.trustedUsers = [ "nixBuild" ];
}
