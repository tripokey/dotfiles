{ pkgs, ... }:

{
  imports = [
    ./modules/common.nix
    ./modules/home.nix
  ];

  home = {
    packages = with pkgs; [
      stdenv.cc
    ];
  };
}
