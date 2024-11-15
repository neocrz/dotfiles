{config, pkgs, ...}:

{
  programs.tmux = {
    enable = true;
    # extraConfig = builtins.readFile ./tmux.conf;
    mouse = true;

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];

    extraConfig = ''
      set-option -g status-position top
   '';
  };
}
