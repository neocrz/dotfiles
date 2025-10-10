{...}: {
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  hardware.nvidia-container-toolkit.enable = true;
  users.users.eee.extraGroups = ["docker"];
}
