{...}: {
  home.shellAliases = {
    g = "git";
    z = "zoxide";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}
