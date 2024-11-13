{
  fonts  = import ./fonts.nix;
  kitty = import ./kitty;
  nushell = import ./nushell;
  packages = import ./packages.nix;
  services = import ./services.nix;
}