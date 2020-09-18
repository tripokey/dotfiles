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
}
