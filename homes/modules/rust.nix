{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      ((pkgs.rustChannelOf { channel = "1.52.1"; }).rust.override { extensions = [ "rust-src" ]; })

      # Needed until https://github.com/mozilla/nixpkgs-mozilla/issues/82 is fixed
      pkgs.stdenv.cc
    ];
  };
}
