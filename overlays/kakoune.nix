self: super:
rec {
  kakoune-unwrapped = super.kakoune-unwrapped.overrideAttrs (old: rec {
    version = "2020.09.01";
    src = super.fetchFromGitHub {
      repo = "kakoune";
      owner = "mawww";
      rev = "v${version}";
      sha256 = "091qzk0qs7hql0q51hix99srgma35mhdnjfd5ncfba1bmc1h8x5i";
    };
    preConfigure = ''
      export version="v${version}"
    '';
  });
  kakoune = (super.kakoune.override {
    configure = {
      plugins = with self.kakounePlugins; [ kak-fzf ];
    };
  });
  kak-lsp = super.rustPlatform.buildRustPackage rec {
    pname = "kak-lsp";
    version = "8.0.0";
    src = super.fetchFromGitHub {
      owner = "ul";
      repo = "kak-lsp";
      rev = "v${version}";
      sha256 = "0nka51szivwhlfkimjiyzj67nxh75m784c28ass6ihlfax631w9m";
    };
    cargoSha256 = "0wrfcg47sq24177ylz0iv7zm3hlrwhfg64f8nsh3isq5mm8civjp";
  };
}
