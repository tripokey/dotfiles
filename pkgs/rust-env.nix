with import <nixpkgs> {};

pkgs.buildEnv {
  name = "rust-env";

  paths = with pkgs; [
    rustc rustfmt cargo rustracer
    (import ./vim { extraPlugins = [ "rust-vim" ]; })
  ];
}
