{ config, pkgs, ... }:

{
  imports = [
    ./locale.nix
    ./editor.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];

  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;
}
