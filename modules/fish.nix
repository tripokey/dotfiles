{ config, lib, pkgs, ... }:

{
  imports = [ ];

  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ../cfg/config.fish;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/fish";
}
