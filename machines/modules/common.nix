{ config, pkgs, ... }:

{
  imports = [
    ./tripokey.nix
    ./locale.nix
    ./editor.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];

  nixpkgs.config.allowUnfree = true;
}
