{
  description = "My dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs: {
    
    nixosConfigurations = {
    a5 = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };

      modules = [ 
        {
            nixpkgs.overlays = [
              (final: prev: {
                unstable = import nixpkgs-unstable {

                  inherit prev;
                  system = prev.system;
                  config.allowUnfree = true;
                };
              })
            ];
        }
        ./configuration.nix
        inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."eee" = ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
      ];
    };
    };
  };
}
