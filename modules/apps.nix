{ config, pkgs, ...}: {
  home.packages = with pkgs; [ 
    
  ] ++ (with pkgs.unstable; [
    bitwarden-desktop
    fastfetch
    floorp
    ghostty
    gh
    neovim
    obsidian
    tmux
  ]);
}
