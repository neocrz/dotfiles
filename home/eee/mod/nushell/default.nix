{config, pkgs, ...}:{
  home.packages = with pkgs;
  [
    nushell
  ];

  home.file.".config/nushell/config.nu".source = ./config.nu;
  home.file.".config/nushell/env.nu".source = ./env.nu;
}