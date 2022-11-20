{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
  };

  home.file.nushell_env = {
    text = ''
    mkdir ~/.cache/starship
    starship init nu | save ~/.cache/starship/init.nu
    '';

    target = ".config/nushell/env.nu";
  };

  home.file.nushell_config = {
    text = ''
    source ~/.cache/starship/init.nu
    '';

    target = ".config/nushell/config.nu";
  };
}
