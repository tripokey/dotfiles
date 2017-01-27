{ config, pkgs, ... }:

let
  user = "tripokey";
  homeDir = "/home/${user}";
  dotfiles = ./.;
in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./layoutSwitcher.nix
      ./fish.nix
      ./xmonad.nix
      ./common.nix
      ./vim.nix
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
    rustracerd
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

  system.activationScripts.dotfiles = (import ./dotfiles.nix {
    user = "${user}";
    homeDir = "${homeDir}";
    dotfiles = "${dotfiles}";
  });
}
