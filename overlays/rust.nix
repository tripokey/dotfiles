let
    rustOverlay = (fetchTarball https://github.com/mozilla/nixpkgs-mozilla/tarball/master);
in
    (import "${rustOverlay}/rust-overlay.nix")
