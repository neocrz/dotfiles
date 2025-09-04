{ config, pkgs, isNixOS, isDroid, isDesktop, ... }:
let
  commonApps = with pkgs; [ ] ++ (with pkgs.unstable; [
  ]);

  desktopApps = with pkgs; [ ] ++ (with pkgs.unstable; [
  ]);

  nixOSApps = with pkgs; [
  ];

  droidApps = with pkgs; [
    procps
    killall
    utillinux
    tzdata
    hostname
    man
  ];

  systemPackages = commonApps ++
    (if isDesktop then desktopApps else []) ++
    (if isNixOS then nixOSApps else []) ++
    (if isDroid then droidApps else []);
in
{
  environment = if isNixOS then {

    systemPackages = systemPackages;
  
  } else if isDroid then {

    packages = systemPackages;

  } else {

    systemPackages = systemPackages;

};
}
