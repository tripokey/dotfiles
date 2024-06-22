{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "pico-8";
  src = ../../../proprietary/pico-8_0.2.6b_amd64.zip;
  nativeBuildInputs = with pkgs; [
    unzip
  ];

  buildInputs = with pkgs; [
    glibc
    makeWrapper
  ];

  buildCommand = ''
    mkdir -p $out/share
    mkdir -p $out/bin
    unzip $src -d $out/share
    patchelf --set-interpreter ${pkgs.glibc}/lib/ld-linux-x86-64.so.2 $out/share/pico-8/pico8_dyn
    makeWrapper $out/share/pico-8/pico8_dyn $out/bin/pico8 --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.wget ]} --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath [ pkgs.SDL2 ]}
  '';
}
