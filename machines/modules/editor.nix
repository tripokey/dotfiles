{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kakoune
  ];

  environment.variables.EDITOR = "kak";
}
