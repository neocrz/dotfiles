{
  description = "dotfiles";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:neocrz/nixvim";
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      genPkgs = {n, s, o ? []}: import n {
        system = s;
        config.allowUnfree = true;
        config.allowUnfreePredicate = pkg: true;
        overlays = [  ] ++ o;
      };
    in {
      homeConfigurations."eee" = 
      let
        pkgs = genPkgs { n = nixpkgs; s = system; };
        pkgs-stable = genPkgs { n = nixpkgs-stable; s = system; };
      in
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        extraSpecialArgs = {inherit inputs pkgs pkgs-stable system;};
        modules = [ ./home/eee ];
      };
      
      nixosConfigurations.a5 = 
      let
        pkgs = genPkgs { n = nixpkgs; s = system; };
        pkgs-stable = genPkgs { n = nixpkgs-stable; s = system; };
      in
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs pkgs pkgs-stable system;};
        modules = [ ./hosts/a5 ];
      };

    };
}
