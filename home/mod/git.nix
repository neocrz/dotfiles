{ config, pkgs, user, ...}:

{
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName  = user.name;
    userEmail = user.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}