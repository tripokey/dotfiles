{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./direnv.nix
    ./nushell.nix
    ./git.nix
    ./htop.nix
    ./helix.nix
    ./keyboard.nix
    ./mosh.nix
    ./niv.nix
    ./ripgrep.nix
    ./rust.nix
    ./skim.nix
    ./taskwarrior.nix
  ];
}
