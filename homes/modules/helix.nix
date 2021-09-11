{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      helix
    ];

    file.helixconfig = {
      source = ../../helix.toml;
      target = ".config/helix/config.toml";
    };
  };
}
