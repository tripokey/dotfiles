{ config, pkgs, ... }:

{
  imports = [
  ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  services.xserver.screenSection = ''
    Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
    Option         "AllowIndirectGLXProtocol" "off"
    Option         "TripleBuffer" "on"
  '';

  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource modesetting NVIDIA-0
    ${pkgs.xorg.xrandr}/bin/xrandr --auto
  '';
}

