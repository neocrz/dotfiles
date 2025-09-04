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

  # repl
  home.packages = [
    (pkgs.writeShellScriptBin "my-nix-fast-repl" ''
      #!${pkgs.bash}/bin/bash
      # Change directory to the root of our flake source in the Nix store
      cd "${toString ../..}"
      
      # Run nix repl from within the flake's directory
      nix repl --file repl.nix "$@"
    '')
  ];
}
