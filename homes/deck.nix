{ pkgs, ... }:

{
  imports = [
    ./modules/common.nix
    ./modules/home.nix
    ./modules/pico8.nix
  ];

  home = {
    packages = with pkgs; [
      stdenv.cc
    ];
  };
}
