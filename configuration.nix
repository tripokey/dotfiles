{ config, pkgs, ... }:

let
  user = "tripokey";
  homeDir = "/home/${user}";
  unstable = import ./unstable.nix {};
  work = ../work/default.nix;
  kakoune = unstable.pkgs.kakoune.overrideDerivation (oldAttrs: rec {
    name = "kakoune-nightly-${version}";
    version = "2017-05-31";
    src = pkgs.fetchFromGitHub {
      repo = "kakoune";
      owner = "mawww";
      rev = "1d74e1edaf022895e1a35095724890fee6db9417";
      sha256 = "0vhqdzgibb9bwvvwda8cgwafxgnyv4qn0jk921w88byrqv07wmsk";
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
    file
  ] ++ (with unstable.pkgs; [
    kakoune
    ranger
    ripgrep
  ]);

  services.xserver = {
    displayManager = {
      slim = {
        defaultUser = "${user}";
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
