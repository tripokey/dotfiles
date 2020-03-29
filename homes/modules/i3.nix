{ pkgs, lib, ... }:

let
  modifier = "Mod4";
in
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
          modifier = "${modifier}";
          keybindings = lib.mkOptionDefault {
            "${modifier}+Return" = "exec xterm -e tmux -2";
            "${modifier}+L" = "exec i3lock -c 000000";
          };
        };

        extraConfig = ''
          bindsym ${modifier}+Shift+g mode "gaming"
          mode "gaming" {
            bindsym ${modifier}+Shift+g mode "default"
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
