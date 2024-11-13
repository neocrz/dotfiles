{config, pkgs, pkgs-stable, ...}:

{
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 
    22000 # syncthing
    # 5123 4242 9100 # ?
  ];
  networking.firewall.allowedUDPPorts = [ 
    22000 21027 # syncthing
    # 5123 4242 9100 # ?
  ];
}