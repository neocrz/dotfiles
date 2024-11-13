{config, host, ...}:

{
  programs.adb.enable = true;
  users.users.${host.username}.extraGroups = [ "adbusers" "plugdev" ];
}