{ config, pkgs, ... }:

let
  user = "tripokey";
  homeDir = "/home/${user}";
in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./modules/layoutSwitcher.nix
      ./modules/fish.nix
      ./modules/xmonad.nix
      ./modules/common.nix
    ];

  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nexus";

  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull unzip
    manpages tldr
    tmux xclip xterm
    firefoxWrapper (import ./pkgs/tvim)
    nix-repl
    direnv
    (import ./pkgs/vim {})
  ];

  services.xserver = {
    displayManager = {
      slim = {
        defaultUser = "${user}";
        autoLogin = true;
      };
    };
  };

  users.extraUsers."${user}" = {
    createHome = true;
    home = "${homeDir}";
    description = "Michael Leandersson";
    extraGroups = [ "wheel" "disk" "vboxusers" "cdrom" ];
    isSystemUser = false;
    useDefaultShell = true;
  };
}
