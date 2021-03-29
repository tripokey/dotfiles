{ pkgs, ... }:

{
  imports = [
    ./modules/common.nix
    ./modules/graphical.nix
    ./modules/home.nix
    ./modules/gaming.nix
  ];

  services = {
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    pasystray.enable = true;
  };

  xsession.windowManager.i3.config.startup = [
    {
      command = "xrandr \\\
      --output DP-4 \\\
        --mode 2560x1440 \\\
      --output eDP-1-1 \\\
        --primary \\\
        --mode 1920x1080 \\\
        --right-of DP-4";
      always = true;
      notification = false;
    }
  ];
}
