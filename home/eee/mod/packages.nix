{pkgs, pkgs-stable, ...}:{
  home.packages = (with pkgs;[
    audacity
    discord
    firefox
    gh
    libreoffice-qt
    love
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