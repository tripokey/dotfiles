{ pkgs, lib, ... }:

let
  modifier = "Mod4";
  wallpaper = builtins.fetchurl {
    url = "https://msgpwebcdn.azureedge.net/ori/wp-content/uploads/2018/06/OriWotWWallpaper_1920x1080.jpg";
    sha256 = "0h6gqzh7cmy85a6a5ac54pxpij826zy3nwhx1vhw8xb3nfip0dma";
  };
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
            "${modifier}+Return" = "exec xterm -e tmux -2";
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
