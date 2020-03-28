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
          modifier = "Mod4";
          keybindings = lib.mkOptionDefault {
            "Mod4+Return" = "exec xterm -e tmux -2";
            "Mod4+L" = "exec i3lock -c 000000";
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
