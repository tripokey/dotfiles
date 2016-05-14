{ config, lib, pkgs, ... }:

{
  imports = [ ];

  programs.fish.enable = true;

  system.activationScripts = { fish = {
      text = ''
        mkdir -p /home/tripokey/.config
        chown tripokey /home/tripokey/.config
        rm -rf /home/tripokey/.config/fish
        ln -sfn /home/tripokey/dotfiles/fish /home/tripokey/.config/fish
      '';
      deps = [];
    };
  };

  users.defaultUserShell = "/run/current-system/sw/bin/fish";
}
