{ pkgs, ... }:
let
  pico8 = import ../../pkgs/pico8 {};
in
{
  home = {
    packages = [
      pico8
    ];
  };

  xdg.desktopEntries = {
    pico8 = {
      name = "PICO-8";
      exec = "${pico8}/bin/pico8";
      terminal = false;
      categories = [ "Game" ];
    };
  };
}

