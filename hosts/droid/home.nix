{ config, lib, pkgs, inputs, ... }:
let
  modulesPath = ../../common/home;
  modulesList = [
    "apps.nix"
    "git.nix"
  ];
  modulesPathList = map (mod: modulesPath + mod) (map (mod: "/" + mod) modulesList);
in
{
  home.stateVersion = "24.05";
  
  imports = modulesPathList;

}
