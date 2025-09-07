{
  config,
  pkgs,
  isNixOS,
  isDroid,
  isDesktop,
  ...
}: let
  commonApps = 
    (with pkgs; []) ++
    (with pkgs.unstable; [
      # dotfiles flake REPL
      (writeShellScriptBin "my-nix-fast-repl" ''
        #!${bash}/bin/bash
        cd "${toString ../..}"

        nix repl --file repl.nix "$@"
      '')
      # Apps
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
  desktopApps = with pkgs;
    []
    ++ (with pkgs.unstable; [
      bitwarden-desktop
      floorp
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
