{ pkgs, ... }:

{
  imports = [
    ./starship.nix
  ];

  programs = {
    nushell = {
      enable = true;
    };
  };

  home.file.nushell_env = {
    source = ../../env.nu;
    target = ".config/nushell/env.nu";
  };

  home.file.nushell_config = {
    source = ../../config.nu;
    target = ".config/nushell/config.nu";
  };
}
