{pkgs, pkgs-stable, ...}:{
  home.packages = (with pkgs;[
    audacity
    bitwarden-desktop
    firefox
    gimp-with-plugins
    gh
    imgbrd-grabber
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
    wacomtablet
  ]);
}
