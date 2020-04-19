{ pkgs, ... }:

{
  imports = [
    ./modules/common.nix
    ./modules/graphical.nix
    ./modules/home.nix
  ];

  services = {
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    pasystray.enable = true;
  };

  xsession.windowManager.i3.config.startup = [
    {
      command = "xrandr --output eDP-1 --scale 0.5x0.5 --primary";
      always = true;
      notification = false;
    }
  ];
}
