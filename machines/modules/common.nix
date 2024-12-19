{ config, pkgs, ... }:

{
  imports = [
    ./editor.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];

  nixpkgs.config.allowUnfree = true;
}
