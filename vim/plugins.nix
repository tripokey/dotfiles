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

  "color_coded" = buildVimPlugin {
    name = "color_coded";
    src = fetchgit {
      url = "https://github.com/jeaye/color_coded";
      rev = "8a205973c5032c50266414f4caa7e8f7ea06739e";
      sha256 = "1bp1an661algaqb8m6pxbpqcjc71q08kknvh4cg0aqrm0fn9r6wl";
    };
    dependencies = [];
    buildInputs = with pkgs; [
      cmake
      lua51Packages.lua
      llvmPackages.clang-unwrapped
      llvmPackages.llvm
    ];

    buildPhase = ''
      patchShebangs .
      mkdir build
      pushd build
      cmake .. -DDOWNLOAD_CLANG=0
      make && make install
      make clean
      popd
    '';
  };
}
