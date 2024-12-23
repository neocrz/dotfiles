{config, pkgs, ...}:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      mp3 = ''yt-dlp -o "%(channel)s - %(title)s.%(ext)s" -x --audio-format mp3 '';
      mp4 = "yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 ";
      no-s = "sudo nixos-rebuild switch --flake ~/dotfiles";
      no-b = "sudo nixos-rebuild boot --flake ~/dotfiles";
      hm-s = "home-manager switch --flake ~/dotfiles";
      z = "zoxide";
    };
  };
}
