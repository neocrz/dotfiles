{pkgs, pkgs-stable, ...}:{
  home.packages = (with pkgs;[
    audacity
    discord
    firefox
    gh
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
    vlc
    vscode
  ]);
}
