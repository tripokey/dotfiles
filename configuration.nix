{ config, pkgs, ... }:

let
  user = "tripokey";
  homeDir = "/home/${user}";
  unstable = import ./unstable.nix {};
  work = ../work/default.nix;
  kakoune = unstable.pkgs.kakoune.overrideDerivation (oldAttrs: rec {
    name = "kakoune-nightly-${version}";
    version = "2017-03-04";
    src = pkgs.fetchFromGitHub {
      repo = "kakoune";
      owner = "mawww";
      rev = "cc88b0f5861254cd9a95e7289f843e68fb7edbc1";
      sha256 = "1iwlyn3s6h7q7wvy0r9v4z61dw2wd2bfwy5vk5v62g3vb7g4igjy";
    };
  });
in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./modules/layoutSwitcher.nix
      ./modules/zsh.nix
      ./modules/i3.nix
      ./modules/common.nix
    ] ++ (if builtins.pathExists work then [ work ] else []);

  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nexus";

  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull unzip
    manpages tldr
    xsel xterm
    firefoxWrapper (import ./pkgs/tkak)
    nix-repl
    indent
  ] ++ (with unstable.pkgs; [
    kakoune
    ranger
    ripgrep
    ycmd
    cargo rustc rustfmt rustracer rustracerd
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
