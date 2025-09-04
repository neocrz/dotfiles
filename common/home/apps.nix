{ config, pkgs, isNixOS, isDroid, isDesktop,...}: 
let
  commonApps = with pkgs; [ ] ++ (with pkgs.unstable; [
    tmux
    fastfetch
    gh
    neovim
  ]);
  
  # mostly GUI
  desktopApps = with pkgs; [ ] ++ (with pkgs.unstable; [
    bitwarden-desktop
    floorp
    ghostty
    obsidian
  ]);
  # Specifics
  nixOSApps = with pkgs; [ ];
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
in
{
  home.packages = commonApps ++
    (if isDesktop then desktopApps else []) ++
    (if isNixOS then nixOSApps else []) ++
    (if isDroid then droidApps else []);
}
