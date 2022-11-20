{ pkgs, ... }:

{
  programs = {
    skim = {
      enable = true;

      defaultCommand = "${pkgs.fd}/bin/fd --type f";

      fileWidgetCommand = "${pkgs.fd}/bin/fd --type f";

      fileWidgetOptions = [ "--preview '${pkgs.bat}/bin/bat --color always {}'" ];
    };
  };
}
