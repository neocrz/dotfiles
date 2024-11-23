{config, pkgs, pkgs-stable, inputs, system, ...}:
{
  # You can update Home Manager without changing this value.
  home.stateVersion = "24.05";

  home.sessionVariables.NIX_PATH = "nixpkgs=${pkgs.path}:stable=${pkgs-stable.path}";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
