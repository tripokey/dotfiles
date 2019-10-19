{ pkgs, lib, ... }:

{
  xsession = {
    enable = true;
    windowManager = {
      i3 = {
        enable = true;

        config = {
          keybindings = lib.mkOptionDefault {
            "Mod1+Return" = "exec urxvt -e tmux";
          };
        };
      };
    };
  };
}
