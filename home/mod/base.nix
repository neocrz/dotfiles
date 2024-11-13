{pkgs, pkgs-stable, ...}:{
  home.sessionVariables.NIX_PATH = "nixpkgs=${pkgs.path}:stable=${pkgs-stable.path}";
}