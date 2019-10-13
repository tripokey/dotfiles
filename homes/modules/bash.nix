{ pkgs, ... }:

{
  programs = {
    bash = {
      enable = true;
      historyControl = [
        "erasedups"
        "ignoredups"
        "ignorespace"
      ];
    };
  };
}
