{ config, pkgs, ... }:

let
  user = "tripokey";
  homeDir = "/home/${user}";
  unstable = import ./unstable.nix;
in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./modules/layoutSwitcher.nix
      ./modules/fish.nix
      ./modules/i3.nix
      ./modules/common.nix
    ];

  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nexus";

  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull unzip
    manpages tldr
    xclip xterm
    firefoxWrapper (import ./pkgs/tkak)
    nix-repl
    direnv
    (import ./pkgs/vim {})
    (import ./pkgs/tml { pkgs = unstable.pkgs; })
    indent
  ] ++ (with unstable.pkgs; [
    kakoune
    ranger
    ripgrep
    ycmd
  ]);

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

  environment.variables.EDITOR = "kak";

  programs.tmux = {
    enable = true;
    extraTmuxConf = builtins.readFile ./cfg/.tmux.conf;
  };
}
