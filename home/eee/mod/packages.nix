{pkgs, pkgs-stable, ...}:{
  home.packages = (with pkgs;[
    audacity
    bitwarden-desktop
    firefox
    gh
    koreader
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
