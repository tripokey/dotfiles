{ pkgs, ... }:

{
  imports = [
    ./bash.nix
    ./bat.nix
    ./direnv.nix
    ./git.nix
    ./htop.nix
    ./kakoune.nix
    ./keyboard.nix
    ./mosh.nix
    ./rust.nix
    ./skim.nix
    ./taskwarrior.nix
    ./tmux.nix
  ];
}
