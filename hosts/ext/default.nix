{
  config,
  pkgs,
  inputs,
  ...
}: let
  modulesPath = ../../common/home;
  modulesList = [
    "apps.nix"
    "bash.nix"
    "confnix.nix"
    "git.nix"
    "tmux.nix"
  ];
  modulesPathList = map (mod: modulesPath + mod) (map (mod: "/" + mod) modulesList);
in {
  home.username = "err";
  home.homeDirectory = "/home/err";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  imports = modulesPathList;

  # home.programs = with pkgs; [
  #   nixgl.nixGLIntel
  # ];
}
