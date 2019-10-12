self: super:
rec {
  kakounePlugins.kak-fzf = super.kakounePlugins.kak-fzf.overrideDerivation (oldAttrs: rec {
    meta = null;
  });
  kakoune-unwrapped = super.kakoune-unwrapped.overrideDerivation (oldAttrs: rec {
    patches = [
      (super.fetchpatch {
        name = "session.patch";
        url = "https://github.com/mawww/kakoune/commit/0e4a4acf61dbcd1e025810f8e67aca2eaeb44e19.patch";
        sha256 = "1gphls8snv1x5lkb1s2wgah0cbygwl5z1pjyrxa8clq31vb0j434";
      })

      (super.fetchpatch {
        name = "session-fix.patch";
        url = "https://github.com/mawww/kakoune/commit/8d76603df4de45f8efc85032c38c1fd96daa560c.patch";
        sha256 = "1pxlc7c87bybfxc362f1dj6c78h3zwkk6wp6wbjzg9pagirxwz9h";
      })

      (super.fetchpatch {
        name = "nix-syntax.patch";
        url = "https://github.com/mawww/kakoune/commit/837416ea389585a812fc789580e028163bd6bebe.patch";
        sha256 = "02z4r5vzw65h2ypnv45h7vr86na8r6sbcfinpc35svq9npkj2gx2";
      })
    ];
  });
  kakoune = (super.kakoune.override {
    configure = {
      plugins = with self.kakounePlugins; [ kak-fzf ];
    };
  });
}
