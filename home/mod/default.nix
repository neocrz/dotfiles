{
  base = import ./base.nix;
  bash = import ./bash.nix;
  git = import ./git.nix;
  packages = import ./packages.nix;
  tmux = import ./tmux.nix;
}