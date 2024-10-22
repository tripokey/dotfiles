{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./direnv.nix
    ./nushell.nix
    ./carapace.nix
    ./git.nix
    ./htop.nix
    ./helix.nix
    ./ripgrep.nix
    ./taskwarrior.nix
    ./nil.nix
  ];
}
