{pkgs, pkgs-stable, ...}:{
  home.packages = (with pkgs;[
    ffmpeg
    nix-tree
    peruse
    yt-dlp
  ]);

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration= true;
  };
}