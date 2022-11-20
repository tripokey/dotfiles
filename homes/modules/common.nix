{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./direnv.nix
    ./nushell.nix
    ./git.nix
    ./htop.nix
    ./kakoune.nix
    ./keyboard.nix
    ./mosh.nix
    ./niv.nix
    ./rust.nix
    ./skim.nix
    ./starship.nix
    ./taskwarrior.nix
    ./tmux.nix
  ];
}
