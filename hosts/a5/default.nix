# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, pkgs-unstable, ... }:
let 
  host = import ./host-info.nix;
  mod.common = import ../mod;
  mod.local = import ./mod;
in 
{
  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ]++(with mod.common;[
    (adb { inherit config pkgs host; })
    (gnome { inherit config pkgs host; })
    nix-conf
  ])++(with mod.local;[
    firewall
    (games { inherit config pkgs host; })
    (hybrid { inherit config pkgs host; })
    nix-conf
    services
    (virtualisation { inherit config pkgs host; })
  ]);
  
  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME    = "$HOME/.local/bin";
    PATH = [ 
      "${XDG_BIN_HOME}"
    ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = host.hostname;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = host.timeZone;

  # Select internationalisation properties.
  i18n.defaultLocale = host.defaultLocale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = host.extraLocale;
    LC_IDENTIFICATION = host.extraLocale;
    LC_MEASUREMENT = host.extraLocale;
    LC_MONETARY = host.extraLocale;
    LC_NAME = host.extraLocale;
    LC_NUMERIC = host.extraLocale;
    LC_PAPER = host.extraLocale;
    LC_TELEPHONE = host.extraLocale;
    LC_TIME = host.extraLocale;
  };
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ 
      /* any engine you want, for example */ 
      anthy
      mozc
    ];
  };

  # Configure console keymap
  console.keyMap = host.keyMap;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.xserver.wacom.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${host.username} = {
    isNormalUser = true;
    description = host.username;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
