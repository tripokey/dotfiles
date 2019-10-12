{ pkgs, ... }:

{
  home = {
    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };

    packages = with pkgs; [
      xsel ripgrep kak-lsp
      mosh
      (pkgs.latest.rustChannels.stable.rust.override { extensions = [ "rust-src" ]; })
    ];

    sessionVariables = {
      EDITOR = "kak";
    };
  };

  programs = {
    alacritty = {
      enable = true;
      settings = {
        # Colors (Solarized Dark)
        colors = {
          # Default colors
          primary = {
            background = "0x002b36"; # base03
            foreground = "0x839496"; # base0
          };
          # Cursor colors
          cursor = {
            text = "0x002b36"; # base03
            cursor = "0x839496"; # base0
          };
          # Normal colors
          normal = {
            black = "0x073642"; # base02
            red = "0xdc322f"; # red
            green = "0x859900"; # green
            yellow = "0xb58900"; # yellow
            blue = "0x268bd2"; # blue
            magenta = "0xd33682"; # magenta
            cyan = "0x2aa198"; # cyan
            white = "0xeee8d5"; # base2
          };
          # Bright colors
          bright = {
            black = "0x002b36"; # base03
            red = "0xcb4b16"; # orange
            green = "0x586e75"; # base01
            yellow = "0x657b83"; # base00
            blue = "0x839496"; # base0
            magenta = "0x6c71c4"; # violet
            cyan = "0x93a1a1"; # base1
            white = "0xfdf6e3"; # base3
          };
        };
      };
    };

    bash = {
      enable = true;
      historyControl = [
        "erasedups"
        "ignoredups"
        "ignorespace"
      ];
    };
      
    bat = {
      enable = true;
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
    };
      
    git = {
      enable = true;
      userName = "Michael Leandersson";
      userEmail = "tripokey@gmail.com";
    };

    htop = {
      enable = true;
    };

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
            commands = "try %{ execute-keys -draft \%s\h+$<ret>d }";
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

        try %{ source .kakrc.local }

        hook global ModuleLoaded fzf %{
          set global fzf_implementation sk
          set global fzf_highlight_command bat
          set global fzf_file_command rg
        }
      '';
    };

    skim = {
      enable = true;
      enableBashIntegration = true;
    };

    tmux = {
      enable = true;
      terminal = "screen-256color";
      shortcut = "a";
      clock24 = true;
      keyMode = "vi";
      escapeTime = 1;
      baseIndex = 1;
      
      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.yank;
          extraConfig = "set -g @plugin 'tmux-plugins/tmux-yank'";
        }

        {
          plugin = tmuxPlugins.tmux-colors-solarized;
          extraConfig = ''
            set -g @plugin 'tmux-plugins/tmux-colors-solarized'
            set -g @colors-solarized 'dark'
          '';
        }
      ];

      extraConfig = ''
        # Disable mouse
        setw -g mouse off

        # Visual bell on window activity
        setw -g monitor-activity on
        set -g visual-activity on

        unbind p

        # Without x clipboard TODO fix x clipboard
        bind-key -T copy-mode-vi 'v' send -X begin-selection
        bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
        bind-key 'p' paste-buffer

        # Key bindings
        bind r source-file ~/.tmux.conf \; display "Reloaded!" 	# Reload config
        bind C-a send-prefix               # Pressing ctrl+a twice sends it to current application
        bind | split-window -h             # Vertical split
        bind - split-window -v             # Horizontal split
        bind h select-pane -L              # Move pane focus to the right
        bind j select-pane -D              # Move pane focus down
        bind k select-pane -U              # Move pane focus up
        bind l select-pane -R              # Move pane focus right
        bind -r C-h select-window -t :-    # Move window focus back
        bind -r C-l select-window -t :+    # Move window focus forward
        bind -r H resize-pane -L 5         # Move pane divider left
        bind -r J resize-pane -D 5         # Move pane divider down
        bind -r K resize-pane -U 5         # Move pane divider down
        bind -r L resize-pane -R 5         # Move pane divider right
      '';
    };
  };
}
