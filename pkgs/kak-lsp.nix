with import <nixpkgs> {};

rustPlatform.buildRustPackage rec {
  name = "kak-lsp-${version}";
  version = "v5.10.0";

  src = fetchFromGitHub {
    owner = "ul";
    repo = "kak-lsp";
    rev = "${version}";
    sha256 = "09n3d5vfvws3rqs81dsykfhxw6gmm8a9pf5i02ydfbxgcj5x3agn";
  };

  cargoSha256 = "1zsfzs59w65i553xk472qn3w1p2bjc9x4baqcrf7s865fqzmy3k3";
}
