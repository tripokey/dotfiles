{ pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
      terminal = "tmux-256color";
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
        set -g default-command ${pkgs.fish}/bin/fish
        set -g default-shell ${pkgs.fish}/bin/fish

        # Disable mouse
        setw -g mouse off

        # Visual bell on window activity
        setw -g monitor-activity on
        set -g visual-activity on

        unbind [
        unbind p

        bind Escape copy-mode

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
