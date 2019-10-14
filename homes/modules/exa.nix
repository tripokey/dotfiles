{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      exa
    ];
  };

  programs.fish.shellAliases = {
    lx = "exa";
  };
}
