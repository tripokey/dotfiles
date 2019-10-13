{ pkgs, ... }:

{
  programs = {
    taskwarrior = {
      enable = true;
      colorTheme = "solarized-dark-256";
    };
  };
}
