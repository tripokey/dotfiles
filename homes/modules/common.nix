{ pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./bat.nix
    ./fd.nix
    ./sd.nix
    ./exa.nix
    ./procs.nix
    ./direnv.nix
    ./git.nix
    ./htop.nix
    ./kakoune.nix
    ./keyboard.nix
    ./mosh.nix
    ./rust.nix
    ./skim.nix
    ./starship.nix
    ./taskwarrior.nix
    ./tmux.nix
  ];
}
