{pkgs, pkgs-stable, ...}:{
  home.packages = (with pkgs;[
    audacity
    bitwarden-desktop
    firefox
    gh
    koodo-reader
    krita
    libreoffice-qt
    love
    luajit
    mpv
    obs-studio
    obsidian
    qbittorrent
    scrcpy
    telegram-desktop
    vesktop
    vlc
    vscode
  ]);
}
