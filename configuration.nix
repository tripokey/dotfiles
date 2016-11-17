{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./layoutSwitcher.nix
      ./fish.nix
      ./xmonad.nix
      ./common.nix
      ./vim.nix
      ./dotfiles.nix
    ];

  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nexus";

  environment.systemPackages = with pkgs; [
    tmux xclip
    xterm
    ghc stack binutils
    firefoxWrapper
    nix-repl
    direnv
  ];

  services.xserver = {
    displayManager = {
      slim = {
        defaultUser = "tripokey";
        autoLogin = true;
      };
    };
  };

  users.extraUsers.tripokey = {
    createHome = true;
    home = "/home/tripokey";
    description = "Michael Leandersson";
    extraGroups = [ "wheel" "disk" "vboxusers" "cdrom" ];
    isSystemUser = false;
    useDefaultShell = true;
  };
}
