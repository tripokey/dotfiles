self: super:
rec {
  appimage-run = super.appimage-run.override {
    extraPkgs = p: with p; [
      at-spi2-core
    ];
  };

  uhk-agent = let
    version = "1.5.0";
    image = self.stdenv.mkDerivation {
      name = "uhk-agent-image";
      src = self.fetchurl {
        url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v${version}/UHK.Agent-${version}-linux-x86_64.AppImage";
        sha256 = "1kwp133ipxd5al9jf0v40grpnpyiqvz95yydv9rylagxllcvr2s4";
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
      sha256 = "0sji3jwcc4sab50bhah4z8qd20k7rw6kmzfsa71mxn9hh4q65lx7";
    };
  in self.runCommand "uhk-agent" {} ''
    mkdir -p $out/bin $out/etc/udev/rules.d
    echo "${appimage-run}/bin/appimage-run ${image}/appimage" > $out/bin/uhk-agent
    chmod +x $out/bin/uhk-agent
    cp "${source}/rules/50-uhk60.rules" $out/etc/udev/rules.d
  '';
}
