self: super:
rec {
  kakoune = (super.kakoune.override {
    configure = {
      plugins = with self.kakounePlugins; [ kak-fzf ];
    };
  });
}
