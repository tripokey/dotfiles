{ config, pkgs, ... }:

{
  services.minecraft-server = {
    enable = true;
    openFirewall = true;
    eula = true;
    package = pkgs.minecraft-server.overrideAttrs (finalAttrs: prevAttrs: {
      version = "1.20.4";
      src = pkgs.fetchurl {
        url = "https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar";
        hash = "sha256-wD+m852qad30E8llo6gwhNt0anoTjOU1ppMpO1Ry02M=";
      };
    });
  };
}
