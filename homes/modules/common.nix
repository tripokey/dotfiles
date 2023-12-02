{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./direnv.nix
    ./nushell.nix
    ./git.nix
    ./htop.nix
    ./helix.nix
    ./ripgrep.nix
    ./taskwarrior.nix
  ];
}
