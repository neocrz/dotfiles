{ inputs, isNixOS, isDesktop, isDroid, ... }:
let
  modulesPath = ../../common/system;
  modulesList = [
    "apps.nix"
  ];
  modulesPathList = map (mod: modulesPath + mod) (map (mod: "/" + mod) modulesList);
in
{
  android-integration.termux-setup-storage.enable = true;
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.registry.nixpkgs-unstable.flake = inputs.nixpkgs-unstable;
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs} nixpkgs-unstable=${inputs.nixpkgs-unstable}" ];
  nix.extraOptions = ''
     experimental-features = nix-command flakes pipe-operators
  '';

  imports = modulesPathList;

  # environment.packages = with pkgs; [ ];

  environment.etcBackupExtension = ".bak";

  system.stateVersion = "24.05";

  
  time.timeZone = "America/Sao_Paulo";

  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs isNixOS isDesktop isDroid;
    };
  };
}
