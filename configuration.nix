{ config, pkgs, ... }:

let
  user = "tripokey";
  homeDir = "/home/${user}";
in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./modules/common.nix
    ];

  networking.hostName = "nexus";

  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull unzip
    manpages tldr
    file
    (import ./pkgs/kakoune.nix)
    (import ./pkgs/kak-lsp.nix)
    ranger ripgrep
    xterm xsel
    fluxbox xorg.xrdb
  ];

  users.extraUsers."${user}" = {
    createHome = true;
    home = "${homeDir}";
    description = "Michael Leandersson";
    extraGroups = [ "wheel" "disk" "cdrom" ];
    isNormalUser = true;
    useDefaultShell = true;
  };

  environment.variables.EDITOR = "kak";

  programs.tmux = {
    enable = true;
    extraTmuxConf = builtins.readFile ./cfg/.tmux.conf;
  };

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "startfluxbox";
  networking.firewall.allowedTCPPorts = [ 3389 ];
}
