{config, pkgs, pkgs-stable, ...}:

{
  nix = {

    nixPath = [ "nixpkgs=${pkgs.path}" "stable=${pkgs-stable.path}" ];

    settings.experimental-features = ["nix-command" "flakes"];

    gc = {

      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";

    };

    # package = pkgs.nixVersions.stable;

  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    stdenv.cc.cc.lib
  ];

}