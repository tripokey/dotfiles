{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      libnotify
      i3lock
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
            "Mod1+L" = "exec i3lock -c 000000";
          };
        };

        extraConfig = ''
          bindsym Mod4+Shift+g mode "gaming"
          mode "gaming" {
            bindsym Mod4+Shift+g mode "default"
          }
        '';
      };
    };
  };

  services = {
    dunst = {
      enable = true;
    };
  };
}
