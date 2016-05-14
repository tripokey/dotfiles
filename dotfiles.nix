{ config, lib, pkgs, ... }:

{
  imports = [ ];

  system.activationScripts = { dotfiles = {
      text = ''
        ln -sfn /home/tripokey/dotfiles/.gitconfig /home/tripokey/.gitconfig
        ln -sfn /home/tripokey/dotfiles/.Xresources /home/tripokey/.Xresources
        ln -sfn /home/tripokey/dotfiles/.tmux.conf /home/tripokey/.tmux.conf
      '';
      deps = [];
    };
  };
}
