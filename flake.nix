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

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs: 
  let
    unstableOverlay = system: final: prev: {
      unstable = import nixpkgs-unstable {
        inherit prev;
        inherit system;
	config.allowUnfree = true;
      };
    };

    mkPkgs = system: import nixpkgs {
      inherit system;
      overlays = [ (unstableOverlay system) ];
      config.allowUnfree = true;
    };
  in
  {
    
    nixosConfigurations = {
      a5 = let
        system = "x86_64-linux";
        pkgs = mkPkgs system;
      in nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
  
        modules = [ 
          {
            nixpkgs.overlays = [ (unstableOverlay system) ];
  	    nixpkgs.config.allowUnfree = nixpkgs.lib.mkDefault true;
          }
          ./hosts/a5
        ];
      };
    };
  };
}
