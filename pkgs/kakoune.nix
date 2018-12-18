with import <nixpkgs> {};

pkgs.kakoune.overrideDerivation (oldAttrs: rec {
    name = "kakoune-${version}";
    version = "v2018.10.27";
    src = pkgs.fetchFromGitHub {
      repo = "kakoune";
      owner = "mawww";
      rev = "${version}";
      sha256 = "1w7jmq57h8gxxbzg0n3lgd6cci77xb9mziy6lr8330nzqc85zp9p";
    };
  })
