{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      taskopen
    ];

    file.taskopenrc = {
      text = ''
        TASKBIN='${pkgs.taskwarrior}/bin/task'
        NOTES_FOLDER="\$HOME/.local/share/tasknotes/"
        NOTES_EXT=".txt"
        PATH_EXT=${pkgs.taskopen}/share/taskopen/scripts
      '';

      target = ".taskopenrc";
    };
  };

  programs = {
    taskwarrior = {
      enable = true;
      colorTheme = "solarized-dark-256";
    };
  };
}
