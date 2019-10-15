{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      (pkgs.latest.rustChannels.stable.rust.override { extensions = [ "rust-src" ]; })

      # Needed until https://github.com/mozilla/nixpkgs-mozilla/issues/82 is fixed
      pkgs.stdenv.cc
    ];
  };
}
