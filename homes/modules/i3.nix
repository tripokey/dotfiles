{ pkgs, lib, ... }:

let
  modifier = "Mod4";
  wallpaper = (import ../../common/wallpaper.nix);
in
{
  home = {
    packages = with pkgs; [
      libnotify
      i3lock
      feh
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
            "${modifier}+Return" = "exec xterm -e fish";
            "${modifier}+L" = "exec i3lock -c 000000";
          };
          startup = [
            {
              command = "${pkgs.feh}/bin/feh --bg-scale ${wallpaper}";
              always = true;
              notification = false;
            }
          ];
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
