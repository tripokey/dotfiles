{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      xsel ripgrep kak-lsp
    ];

    sessionVariables = {
      EDITOR = "kak";
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

        def nw %{
          tmux-repl-window "kak -c %val{session}"
        }

        def nv %{
          tmux-repl-vertical "kak -c %val{session}"
        }

        def nh %{
          tmux-repl-horizontal "kak -c %val{session}"
        }

        def rw %{
          tmux-repl-window
        }

        def rv %{
          tmux-repl-vertical
        }

        def rh %{
          tmux-repl-horizontal
        }

        # Highlight search matches in italic
        add-highlighter global/ dynregex '%reg{/}' 0:+i

        def find -params 1 -shell-script-candidates %{ find . -type f } %{ edit %arg{1} }

        def git-edit -params 1 -shell-script-candidates %{ git ls-files } %{ edit %arg{1} }

        eval %sh{kak-lsp --kakoune -s $kak_session}
        lsp-enable
        lsp-auto-hover-enable

        hook global ModuleLoaded fzf %{
          set global fzf_implementation sk
          set global fzf_highlight_command bat
          set global fzf_file_command rg
        }
      '';
    };
  };
}
