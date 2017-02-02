with import <nixpkgs> {};

{extraPlugins ? [ ], extraVimrc ? "" }:
let
  vimrc = builtins.readFile ./vimrc/default.vim;
  plugins = callPackage ./plugins.nix {};
  rc = ''
  ${vimrc}
  ${extraVimrc}
    '';
  vamConfig = {
    knownPlugins = pkgs.vimPlugins // plugins;
    pluginDictionaries = [ { names = [
        "sensible"
        "vim-nix"
        "fugitive"
        "Solarized"
        "vim-gitgutter"
        "Tagbar"
        "fzf-vim"
        "fzfWrapper"
        "trailing-whitespace"
        "YouCompleteMe"
        "neomake"
        ] ++ extraPlugins;
      }
    ];
  };

  custom_vim = vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = rc;
    vimrcConfig.vim = vamConfig;
  };
  custom_neovim = pkgs.neovim.override {
    vimAlias = true;
    configure = {
      customRC = rc;
      vam = vamConfig;
    };
  };
in
pkgs.buildEnv {
  name = "custom_vim";

  paths = [
    (lib.overrideDerivation custom_neovim (o: {
      ftNixSupport             = true;
    }))
    ctags
    silver-searcher
    fzf
    zsh
  ];
}
