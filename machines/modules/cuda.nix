{ config, pkgs, lib, ... }:

{
  nixpkgs.config.cudaSupport = true;
  nixpkgs.config.cudaVersion = "12.2";
}
