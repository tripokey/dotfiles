{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import ../../overlays/uhk.nix)
  ];

  environment.systemPackages = with pkgs; [
    uhk-agent
  ];

  services.udev.packages = with pkgs; [
    uhk-agent
  ];
}
