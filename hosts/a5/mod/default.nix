{
  firewall = import ./firewall.nix;
  games = import ./games.nix;
  hybrid = import ./hybrid.nix;
  nix-conf = import ./nix-conf.nix;
  services = import ./services.nix;
  virtualisation = import ./virtualisation.nix;
}