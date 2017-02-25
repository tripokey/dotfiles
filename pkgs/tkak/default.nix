with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "tkak";

  src = ./.;

  buildCommand = ''
    mkdir -p $out/bin
    cat <<EOF >$out/bin/tkak
    #!${bash}/bin/bash
    PATH=${stdenv.lib.makeSearchPath "bin" [tmux]}:\$PATH
    EOF
    cat $src/tkak >>$out/bin/tkak
    chmod +x $out/bin/tkak
  '';
}
