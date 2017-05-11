{ config, lib, pkgs, ... }:

let
  unstable = import ../unstable.nix {};

  zsh-syntax-highlighting = pkgs.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-syntax-highlighting";
    rev = "9523d6d49cb3d4db5bd84c3cec6168a2057fe3ab";
    sha256 = "04g79s34yxdyr0576wd172s49p0fqcf8jiq845c04dyzhqpzc98l";
  };

  zsh-autosuggestions = pkgs.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-autosuggestions";
    rev = "fedc22e9bbd046867860e772d7d6787f5dae9d4c";
    sha256 = "0mnwyz4byvckrslzqfng5c0cx8ka0y12zcy52kb7amg3l07jrls4";
  };

  zsh-history-substring-search = pkgs.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-history-substring-search";
    rev = "aae3388491c2312c4efb2e86bcb999927bb2900e";
    sha256 = "0lgmq1xcccnz5cf7vl0r0qj351hwclx9p80cl0qczxry4r2g5qaz";
  };
in
{
  imports = [ ];

  environment.systemPackages = [
    unstable.oh-my-zsh
  ];

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      export ZSH=${unstable.oh-my-zsh}/share/oh-my-zsh/

      # Customize your oh-my-zsh options here
      ZSH_THEME="robbyrussell"
      plugins=(git vi-mode)
      DISABLE_AUTO_UPDATE="true"

      source $ZSH/oh-my-zsh.sh

      alias ssh='TERM=xterm ssh'
      alias tmux='tmux -2'
      alias ns='nix-shell --command zsh'
      alias pns='nix-shell --indirect --add-root $HOME/.gcroots/dep --command zsh'
      alias nsu='nix-shell --command zsh -I stable=${builtins.toString <nixpkgs>} -I nixpkgs=${../unstable.nix}'

      source ${zsh-autosuggestions}/zsh-autosuggestions.zsh
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

      source ${zsh-syntax-highlighting}/zsh-syntax-highlighting.zsh

      source ${zsh-history-substring-search}/zsh-history-substring-search.zsh
      bindkey "''${key[Up]}" history-substring-search-up
      bindkey "''${key[Down]}" history-substring-search-down
      bindkey -M vicmd 'k' history-substring-search-up
      bindkey -M vicmd 'j' history-substring-search-down
    '';
    promptInit = "";
  };

  users.defaultUserShell = "/run/current-system/sw/bin/zsh";
}
