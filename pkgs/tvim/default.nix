with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "tvim";

  src = ./.;

  buildCommand = ''
    mkdir -p $out/bin
    cat <<EOF >$out/bin/tvim
    #!${bash}/bin/bash
    PATH=${stdenv.lib.makeSearchPath "bin" [tmux]}:\$PATH
    EOF
    cat $src/tvim >>$out/bin/tvim
    chmod +x $out/bin/tvim
  '';
}
