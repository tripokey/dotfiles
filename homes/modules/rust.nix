{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      (pkgs.latest.rustChannels.stable.rust.override { extensions = [ "rust-src" ]; })
    ];
  };
}
