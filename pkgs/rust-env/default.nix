with import <nixpkgs> {};

pkgs.buildEnv {
  name = "rust-env";

  paths = with pkgs; [
    rustc rustfmt cargo rustracerd
    (import ../vim {
      extraPlugins = [ "rust-vim" ];
      extraVimrc = (builtins.readFile ./rust.vim) +
        "let g:ycm_rust_src_path = '${rustc.src}/src'";
    })
  ];
}
