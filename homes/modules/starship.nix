{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      starship
    ];
  };

  programs.fish.shellInit = "eval (${pkgs.starship}/bin/starship init fish)";
}
