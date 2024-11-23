{ config, inputs, pkgs, pkgs-stable, system, ... }:
let 
  user = import ../user.nix;
  mod.common = import ../mod;
  mod.local = import ./mod;
in 
{
  imports = (with mod.common;[
    base
    bash
    (git { inherit config pkgs user; })
    packages
    tmux
  ])++(with mod.local;[
    fonts
    kitty
    nushell
    packages
    services
  ]);

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  home.packages = [
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".screenrc".source = dotfiles/screenrc
    # ".gradle/gradle.properties".text = '' '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/eee/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.username = user.username;
  home.homeDirectory = "/home/${user.username}";
  home.stateVersion = "24.05";
}
