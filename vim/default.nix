with import <nixpkgs> {};

let
  vimrc = builtins.readFile ./vimrc/default.vim;
  vimrcAdaptation = builtins.readFile ./vimrc/adaptation.vim;
  plugins = callPackage ./plugins.nix {};
  rc = ''
  ${vimrc}
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
        "fzf"
        "fzf.vim"
        "trailing-whitespace"
        "YouCompleteMe"
        #"color_coded"
        ];
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
lib.overrideDerivation custom_neovim (o: {
    ftNixSupport             = true;
    #luaSupport              = true;
    })
