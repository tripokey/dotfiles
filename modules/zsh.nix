{ config, lib, pkgs, ... }:

let
  unstable = import ../unstable.nix {};

  zsh-syntax-highlighting = pkgs.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-syntax-highlighting";
    rev = "ad522a091429ba180c930f84b2a023b40de4dbcc";
    sha256 = "0zzhkg969l4ijn32mi6ajq1hfq7kbg465vc412r282d8k5i0r0kj";
  };

  zsh-autosuggestions = pkgs.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-autosuggestions";
    rev = "2cb6eb6e29852e64a146b0284275ecdc0661b082";
    sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
  };

  zsh-history-substring-search = pkgs.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-history-substring-search";
    rev = "c750a17757478686b671f6cdd3f2fc3cfb078edf";
    sha256 = "18mhbzi0gavhsrhxs100ampl8krlnyh58sj3vbq38pgkbi5aqii9";
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
      alias pkak='kak -E "%sh{cd \"$(git rev-parse --show-toplevel)\" && cat .project.kak}"'

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
