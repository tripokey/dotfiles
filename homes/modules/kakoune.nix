{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      xsel ripgrep kak-lsp
    ];

    sessionVariables = {
      EDITOR = "kak";
    };

    file."kak-lsp.toml" = {
      target = ".config/kak-lsp/kak-lsp.toml";
      text = ''
        snippet_support = false
        verbosity = 2

        [sematic_scopes]
        variable = "variable"
        entity_name_function = "function"
        entity_name_type = "type"
        variable_other_enummember = "variable"
        entity_name_namespace = "module"

        [server]
        timeout = 1800

        [language.rust]
        filetypes = ["rust"]
        roots = ["Cargo.toml"]
        command = "rls"
      '';
    };
  };

  programs = {
    kakoune = {
      enable = true;
      config = {
        colorScheme = "solarized-dark";
        showMatching = true;
        wrapLines.enable = true;
        indentWidth = 2;

        ui = {
          setTitle = true;
          assistant = "cat";
          enableMouse = false;
        };

        numberLines = {
          enable = true;
          relative = true;
          highlightCursor = true;
        };

        keyMappings = [
          {
            mode = "normal";
            key = "<c-p>";
            effect = ": fzf-mode<ret>";
          }

          {
            mode = "normal";
            key = "'#'";
            effect = ":comment-line<ret>";
          }
        ];

        hooks = [
          {
            name = "WinSetOption";
            option = "filetype=rust";
            commands = "set global makecmd 'cargo'";
          }

          # Trim trailing whitespaces
          {
            name = "BufWritePre";
            option = ".*";
            commands = "try %{ execute-keys -draft \\%s\\h+$<ret>d }";
          }
        ];
      };

      extraConfig = ''

        decl str grepcmd 'rg --column'

        hook global ModuleLoaded tmux %{
          alias global rv tmux-repl-vertical
          alias global rh tmux-repl-horizontal
          alias global rw tmux-repl-window

          define-command -docstring "nh [<commands>]: split kak vertically" \
          nh -params .. -command-completion %{
            tmux-terminal-horizontal kak -c %val{session} -e "%arg{@}"
          }

          define-command -docstring "nv [<commands>]: split kak horizontally" \
          nv -params .. -command-completion %{
            tmux-terminal-vertical kak -c %val{session} -e "%arg{@}"
          }

          define-command -docstring "nw [<commands>]: create new kak window" \
          nw -params .. -command-completion %{
            tmux-terminal-window kak -c %val{session} -e "%arg{@}"
          }
        }

        # Highlight search matches in italic
        add-highlighter global/ dynregex '%reg{/}' 0:+i

        def find -params 1 -shell-script-candidates %{ find . -type f } %{ edit %arg{1} }

        def git-edit -params 1 -shell-script-candidates %{ git ls-files } %{ edit %arg{1} }

        eval %sh{kak-lsp --kakoune -s $kak_session}
        lsp-enable

        hook global WinSetOption filetype=rust %{
          set-option global lsp_server_configuration rust.clippy_preference="on"
          lsp-auto-hover-enable
        }

        hook global ModuleLoaded fzf %{
          set global fzf_implementation sk
          set global fzf_highlight_command bat
          set global fzf_file_command rg
        }
      '';
    };
  };
}
