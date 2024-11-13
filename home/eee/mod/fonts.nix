{config, pkgs, ...}:{
  home.packages = with pkgs;
  [
    dejavu_fonts
    powerline-fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  fonts.fontconfig.enable = true;
}