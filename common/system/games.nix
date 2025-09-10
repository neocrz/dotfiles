{ pkgs, ... }:{
  programs.appimage.enable = true;
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    protontricks.enable = true;
  };

  environment.systemPackages = with pkgs; [
    lutris
    playonlinux
    steam-run
    wineWowPackages.waylandFull
    winetricks
  ];
}
