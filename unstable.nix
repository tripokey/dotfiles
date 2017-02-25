with import <nixpkgs> {};

import (pkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs-channels";
    rev = "4610fc9310947cfea56c9150a1e10d6cac79fa82";
    sha256 = "07aq18n8jcn75fwmkl4ypsqjswnlrjad1a2ivd1mk9q59pdwfnrf";
  }) {}

