{ pkgs, ... }:

{
  home = {
    keyboard = {
      layout = "us,se";

      options = [
        "grp:caps_toggle"
      ];
    };
  };
}
