{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {
  "trailing-whitespace" = buildVimPlugin {
    name = "trailing-whitespace";
    src = fetchgit {
      url = "https://github.com/bronson/vim-trailing-whitespace";
      rev = "733fb64337b6da4a51c85a43450cd620d8b617b5";
      sha256 = "1469bd744lf8vk1nnw7kyq4ahpw84crp614mkpq88cs6rhvjhcyw";
    };
    dependencies = [];
  };
}
