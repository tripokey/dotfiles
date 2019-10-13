{ pkgs, ... }:

{
  programs = {
    skim = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
