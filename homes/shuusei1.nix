{ pkgs, ... }:

{
  imports = [
    ./modules/common.nix
    ./modules/home.nix
  ];
}
