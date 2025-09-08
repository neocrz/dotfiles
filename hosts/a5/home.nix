{ config, pkgs, inputs, ... }:
let
  modulesPath = ../../common/home;
  modulesList = [
    "apps.nix"
    "bash.nix"
    "git.nix"
    "services.nix"
  ];
  modulesPathList = map (mod: modulesPath + mod) <| map (mod: "/" + mod) modulesList; 
in
{
  home.username = "eee";
  home.homeDirectory = "/home/eee";
  home.stateVersion = "25.05";
  
  imports = modulesPathList;
}
