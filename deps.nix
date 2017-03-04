with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "setup-deps";

  buildInputs = [
    bash
    (import ./pkgs/tml { pkgs = import ./unstable.nix {}; })
  ];
}
