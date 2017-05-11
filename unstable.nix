let
  stable = builtins.tryEval (import <stable> {});
  pkgs = if stable.success then stable.value else import <nixpkgs> {};
in
import (pkgs.fetchFromGitHub {
  owner = "NixOS";
  repo = "nixpkgs-channels";
  rev = "9c90ff7e7df9ceadc7335bb43cc67ba92e171d53";
  sha256 = "0b2gwbssb530rij8vg6i62rizbxp3i3hi1jif5179rdnjxdl42q2";
})
