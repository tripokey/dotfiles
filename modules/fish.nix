{ config, lib, pkgs, ... }:

{
  imports = [ ];

  programs.fish.enable = true;

  users.defaultUserShell = "/run/current-system/sw/bin/fish";
}
