{config, pkgs, host, ...}:
let
  username = host.username;
in
{

  boot.extraModulePackages = [ ];

  environment.systemPackages = with pkgs; [
    bottles
    docker-compose
    playonlinux
    remmina
    winetricks
    wineWowPackages.stable
  ];

  hardware.nvidia-container-toolkit.enable = true;
  nixpkgs.config.cudaSupport = true;
  programs.virt-manager.enable = true;



  virtualisation = {
    docker = {
      enable = true;
      enableNvidia = true; # deprecated
      extraOptions = "--add-runtime nvidia=/run/current-system/sw/bin/nvidia-container-runtime";
    };

    libvirtd.enable = true;
    podman.enable = true;
    waydroid.enable = true;
  };

  users.users.${username}.extraGroups = [ "libvirtd" "docker" ];

}
