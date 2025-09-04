{ config, lib, pkgs, inputs, isNixOS, isDesktop, isDroid, ... }:
let
  modulesPath = ../../common/system;
  modulesList = [
    "apps.nix"
  ];
  modulesPathList = map (mod: modulesPath + mod) (map (mod: "/" + mod) modulesList);
in
{
  imports = modulesPathList;

  environment.packages = with pkgs; [ ];

  environment.etcBackupExtension = ".bak";

  system.stateVersion = "24.05";

  nix.extraOptions = ''
    experimental-features = nix-command flakes pipe-operators
  '';

  time.timeZone = "America/Sao_Paulo";

  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
    extraSpecialArts = {
      inherit inputs isNixOS isDesktop isDroid;
    };
  };
}
