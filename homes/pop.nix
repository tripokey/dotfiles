{ config, pkgs, ... }:

{
  imports = [
    ./modules/bat.nix
    ./modules/direnv.nix
    ./modules/nushell.nix
    ./modules/git.nix
    ./modules/home.nix
    ./modules/kakoune.nix
    ./modules/skim.nix
    ./modules/starship.nix
    ./modules/taskwarrior.nix
    ./modules/tmux.nix
  ];

  home = {
    packages = with pkgs; [
      fira-code
    ];
  };

  xdg.configFile."alacritty/alacritty.yml".source = ../alacritty.yml;

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;

  home.username = "tripokey";
  home.homeDirectory = "/home/tripokey";

  home.stateVersion = "21.11";
}
