{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bat
    ];

    file.batconfig = {
      source = ../../bat.conf;
      target = ".config/bat/config";
    };
  };
}
