self: super:
rec {
  appimage-run = super.appimage-run.override {
    extraPkgs = p: with p; [
      at-spi2-core
    ];
  };

  uhk-agent = let
    version = "1.4.5";
    image = self.stdenv.mkDerivation {
      name = "uhk-agent-image";
      src = self.fetchurl {
        url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v${version}/UHK.Agent-${version}-linux-x86_64.AppImage";
        sha256 = "1nimb8ab7p478p8xpa5lkdddwr1g59cp9jly167fc47gqq8zs7kl";
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
      sha256 = "0nh07b03dn9fky93307bkikgiz9wfaba2nbkxmfc9vk8zf34wsfx";
    };
  in self.runCommand "uhk-agent" {} ''
    mkdir -p $out/bin $out/etc/udev/rules.d
    echo "${appimage-run}/bin/appimage-run ${image}/appimage" > $out/bin/uhk-agent
    chmod +x $out/bin/uhk-agent
    cp "${source}/rules/50-uhk60.rules" $out/etc/udev/rules.d
  '';
}
