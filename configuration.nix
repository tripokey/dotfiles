{ config, pkgs, ... }:

let
  user = "tripokey";
  homeDir = "/home/${user}";
  unstable = import ./unstable.nix {};
  work = ../work/default.nix;
  kakoune = unstable.pkgs.kakoune.overrideDerivation (oldAttrs: rec {
    name = "kakoune-nightly-${version}";
    version = "2017-04-12";
    src = pkgs.fetchFromGitHub {
      repo = "kakoune";
      owner = "mawww";
      rev = "8fa7e67abc9815afa78dfbd13bae1516bff564b1";
      sha256 = "1vaj3jgz2p80c1synripii4ilka0mlrs7pv3pqg2n9sh42hcwxy6";
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
