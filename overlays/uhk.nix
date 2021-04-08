self: super:
rec {
  appimage-run = super.appimage-run.override {
    extraPkgs = p: with p; [
      at-spi2-core
      xorg.libxshmfence
    ];
  };

  uhk-agent = let
    version = "1.5.11";
    image = self.stdenv.mkDerivation {
      name = "uhk-agent-image";
      src = self.fetchurl {
        url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v${version}/UHK.Agent-${version}-linux-x86_64.AppImage";
        sha256 = "1xc0p5ncxzmz5iiwf7cwwiqfwxc49qvd84wawlak9mwm7a5rqrpn";
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
      sha256 = "1pkxpyk9ih243vj5mjaspqv2i9xvx086fzri7ggwgjj0z71l271q";
    };
  in self.runCommand "uhk-agent" {} ''
    mkdir -p $out/bin $out/etc/udev/rules.d
    cat << EOF > $out/bin/uhk-agent
    #!${self.bash}/bin/bash
    ${appimage-run}/bin/appimage-run ${image}/appimage \$@
    EOF
    chmod +x $out/bin/uhk-agent
    cp "${source}/rules/50-uhk60.rules" $out/etc/udev/rules.d
  '';
}
