{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      fira-code
    ];
  };

  fonts.fontconfig.enable = true;

  xresources = {
    properties = {
      "*font" = "xft:Fira Code:style=Retina:size=9:antialias=true:hinting=true";
    };

    extraConfig = builtins.readFile (
      pkgs.fetchFromGitHub {
        owner = "solarized";
        repo = "xresources";
        rev = "025ceddbddf55f2eb4ab40b05889148aab9699fc";
        sha256 = "0lxv37gmh38y9d3l8nbnsm1mskcv10g3i83j0kac0a2qmypv1k9f";
      } + "/Xresources.dark"
    );
  };
}
