self: super:
rec {
  appimage-run = super.appimage-run.override {
    extraPkgs = p: with p; [
      at-spi2-core
    ];
  };

  uhk-agent = let
    version = "1.2.15";
    image = self.stdenv.mkDerivation {
      name = "uhk-agent-image";
      src = self.fetchurl {
        url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v${version}/UHK.Agent-${version}-linux-x86_64.AppImage";
        sha256 = "0123095p9gvmx05lz72hxcypfdwxnglvf9fxshabd54074x53ady";
      };
      buildCommand = ''
        mkdir -p $out
        cp $src $out/appimage
        chmod ugo+rx $out/appimage
      '';
    };
    source = self.fetchFromGitHub {
      owner = "UltimateHackingKeyboard";
      repo = "agent";
      rev = "v${version}";
      sha256 = "0wh81pi4n2d1zb3xa8c1950382r6xmkyk11gfxcy50ljs9j1isw2";
    };
  in self.runCommand "uhk-agent" {} ''
    mkdir -p $out/bin $out/etc/udev/rules.d
    echo "${appimage-run}/bin/appimage-run ${image}/appimage" > $out/bin/uhk-agent
    chmod +x $out/bin/uhk-agent
    cp "${source}/rules/50-uhk60.rules" $out/etc/udev/rules.d
  '';
}
