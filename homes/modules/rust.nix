{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      pkgs.stdenv.cc
      rustup
    ];
  };
}
