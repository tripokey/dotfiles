{ pkgs, lib, ... }:

{
  xsession = {
    enable = true;
    windowManager = {
      i3 = {
        enable = true;

        config = {
          keybindings = lib.mkOptionDefault {
            "Mod1+Return" = "exec xterm -e tmux -2";
          };
        };
      };
    };
  };
}
