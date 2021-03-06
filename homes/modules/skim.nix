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

  home.file.skim_fish_keybindings = {
    text = ''
      function fish_user_key_bindings
        if command -s sk-share >/dev/null
          source (sk-share)/key-bindings.fish
        end

        skim_key_bindings
      end
    '';

    target = ".config/fish/functions/fish_user_key_bindings.fish";
  };
}
