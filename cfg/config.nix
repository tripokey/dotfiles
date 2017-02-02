{
  packageOverrides = pkgs: with pkgs; rec {
    rust-env = import ../pkgs/rust-env.nix;
  };
}
