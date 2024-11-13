{pkgs, pkgs-stable, ...}:{
  home.packages = (with pkgs;[
    firefox
    vscode
  ]);
}