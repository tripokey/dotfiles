{ pkgs }:

with pkgs.rustPlatform;

buildRustPackage rec {
  name = "tml-${version}";
  version = "0.2.0";

  depsSha256 = "1x31zlzxc7bkab8li26p3zrdk36q1l5lc1k2xrgdsmdaww3ml1ra";

  src = pkgs.fetchFromGitHub {
    owner = "tripokey";
    repo = "tml";
    rev = "${version}";
    sha256 = "1084xv1fhmlnw747da1s3sa357khb6hsw75b8nyzld88lj3q1xx7";
  };
}
