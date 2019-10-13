{ config, pkgs, ... }:

{
  nix = {
    distributedBuilds = true;
    buildMachines = [
      {
        hostName = "192.168.158.5";
        sshUser = "nixBuild";
        sshKey = "/root/.ssh/id_nixBuild";
        system = "x86_64-linux";
        maxJobs = 16;
      }
    ];
  };
}
