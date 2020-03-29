self: super:
rec {
  appimage-run = super.appimage-run.override {
    extraPkgs = p: with p; [
      at-spi2-core
    ];
  };

  uhk-agent = let
    version = "1.4.3";
    image = self.stdenv.mkDerivation {
      name = "uhk-agent-image";
      src = self.fetchurl {
        url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v${version}/UHK.Agent-${version}-linux-x86_64.AppImage";
        sha256 = "18kfpjy5pvz2iwwpnynii9xmisbygclwn6z6c6dsgwn2wni35d6d";
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
      sha256 = "0zqjjyy1d5yna6cfgj73ds4y6hizq1whinmaf9ifhmd952bkf0a0";
    };
  in self.runCommand "uhk-agent" {} ''
    mkdir -p $out/bin $out/etc/udev/rules.d
    echo "${appimage-run}/bin/appimage-run ${image}/appimage" > $out/bin/uhk-agent
    chmod +x $out/bin/uhk-agent
    cp "${source}/rules/50-uhk60.rules" $out/etc/udev/rules.d
  '';
}
