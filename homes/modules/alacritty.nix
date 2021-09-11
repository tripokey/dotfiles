{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      fira-code
    ];
  };

  fonts.fontconfig.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      # Gruvbox Dark
      colors = {
        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
        };

        normal = {
          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };

        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };
      };

      font = {
        normal = {
          family = "Fira Code";
          style = "Normal";
        };

        bold = {
          family = "Fira Code";
          style = "Bold";
        };

        italic = {
          family = "Fira Code";
          style = "Light";
        };
      };
    };
  };
}
