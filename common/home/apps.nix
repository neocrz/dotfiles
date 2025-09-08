{
  pkgs,
  isNixOS,
  isDroid,
  isDesktop,
  ...
}: let
  my-nix-fast-repl = pkgs.writeShellScriptBin "my-nix-fast-repl" ''
    #!/usr/bin/env bash
    cd "${toString ../..}"

    nix repl --file repl.nix "$@"
  '';

  commonApps = 
    (with pkgs.unstable; [
      my-nix-fast-repl
      # Apps
      bat
      btop
      fastfetch
      gh
      tmux
      yazi
    ]) ++
    (with pkgs.neocrz; [
      # MY PKGS
      nvf
      my-echo
    ]);

  # mostly GUI
  desktopApps = (with pkgs.unstable; [
      bitwarden-desktop
      floorp
      foliate
      godot
      ghostty
      obsidian
      vesktop
    ]);

  # Specifics
  nixOSApps = with pkgs; [];
  droidApps = with pkgs; [
    diffutils
    findutils
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
  ];
in {
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
  
  home.packages =
    commonApps
    ++ (
      if isDesktop
      then desktopApps
      else []
    )
    ++ (
      if isNixOS
      then nixOSApps
      else []
    )
    ++ (
      if isDroid
      then droidApps
      else []
    );
}
