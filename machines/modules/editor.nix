{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
  ];

  environment.variables.EDITOR = "hx";
}
