{ config, pkgs, lib, ... }:
let
  pname = "uhk-agent";
  version = "3.1.0";
  src = pkgs.fetchurl {
    url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v${version}/UHK.Agent-${version}-linux-x86_64.AppImage";
    name = "${pname}-${version}.AppImage";
    sha256 = "sha256-KFuB1cbrEDfqeRyrhXZs4ClhdIjZqIT5a+rnvdi3kpA=";
  };
  appimageContents = pkgs.appimageTools.extract {
    name = "${pname}-${version}";
    inherit src;
  };
  uhk-agent = pkgs.appimageTools.wrapType2 rec {
    inherit pname version src;

    extraPkgs = pkgs: with pkgs; [ polkit udev ];

    extraInstallCommands = ''
      mv $out/bin/${pname}-${version} $out/bin/${pname}

      install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
      install -m 644 -D ${appimageContents}/resources/rules/50-uhk60.rules $out/rules/50-uhk60.rules
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
      cp -r ${appimageContents}/usr/share/icons $out/share
    '';

    passthru.version = version;
  };
in
{
  environment.systemPackages = with pkgs; [
    uhk-udev-rules
    uhk-agent
  ];

  hardware.keyboard.uhk.enable = true;
}

