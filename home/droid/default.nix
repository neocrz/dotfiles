{ config, lib, pkgs, inputs, pkgs-stable, system, ... }:

{
  environment.packages = with pkgs; [
    hostname
    man
    nano
  ];
  environment.etcBackupExtension = ".bak";
  system.stateVersion = "24.05";
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  time.timeZone = "America/Sao_Paulo";
  
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs pkgs pkgs-stable system; };
  };
}
