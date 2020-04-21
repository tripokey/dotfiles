{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      character = {
        symbol = ">";
      };
    };
  };
}
