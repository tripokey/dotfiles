{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      exa
    ];
  };

  programs.fish.shellAbbrs = {
    ls = "exa";
    la = "exa -a";
    ll = "exa -l";
    lt = "exa -T";
    lr = "exa -R";
  };
}
