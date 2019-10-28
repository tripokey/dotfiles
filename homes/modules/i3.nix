{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      libnotify
    ];
  };

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

  services = {
    dunst = {
      enable = true;
    };
  };
}
