{ config, pkgs, ... }:

let
  user = "tripokey";
  homeDir = "/home/${user}";
  kakoune = pkgs.kakoune.overrideDerivation (oldAttrs: rec {
    name = "kakoune-${version}";
    version = "v2018.09.04";
    src = pkgs.fetchFromGitHub {
      repo = "kakoune";
      owner = "mawww";
      rev = "${version}";
      sha256 = "08v55hh7whm6hx6a047gszh0h5g35k3r8r52aggv7r2ybzrrw6w1";
    };
  });
in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./modules/layoutSwitcher.nix
      ./modules/fluxbox.nix
      ./modules/common.nix
    ];

  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nexus";

  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull unzip
    manpages tldr
    xsel xterm
    firefoxWrapper
    indent
    file
    kakoune ranger ripgrep
  ];

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
