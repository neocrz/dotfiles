# home/modules/apps.nix
{
  pkgs,
  lib,
  config,
  ...
}: let
  isDroid = config.isDroid;
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
      bzip2
      fastfetch
      ffmpeg
      gnutar
      gh
      gzip
      p7zip
      unzip
      xz
      yazi
      zip
    ])
    ++ (with pkgs.neocrz; [
      nvf
    ]);

  # mostly GUI
  desktopApps = with pkgs.unstable; [
    audacity
    bitwarden-desktop
    krita
    floorp-bin
    foliate
    godot
    ghostty
    mpv
    obsidian
    penpot-desktop
    qbittorrent
    vesktop
  ];

  # Specifics
  droidApps = with pkgs; [
    diffutils
    findutils
    gnugrep
    gnupg
    gnused
  ];
in {
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  home.packages =
    []
    ++ commonApps
    ++ lib.optionals isDroid droidApps
    ++ lib.optionals (!isDroid) desktopApps;
}
