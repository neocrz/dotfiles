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
      # MY PKGS
      nvf
      my-echo
    ]);

  # mostly GUI
  desktopApps = with pkgs.unstable; [
    anydesk
    bitwarden-desktop
    krita
    floorp
    foliate
    godot
    ghostty
    obsidian
    vesktop
    vscodium-fhs
  ];

  # Specifics
  nixOSApps = with pkgs; [];
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
