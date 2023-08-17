# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # System
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-23.05";
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  
    # Flake
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/mnt/HDD" = {
    device = "/dev/disk/by-uuid/38E4DF3B7B58A5F4";
    fsType = "ntfs";
    options = [
      "uid=1000"
      "gid=1000"
      "rw"
      "user"
      "exec"
      "umask=000"
    ];
  };

  networking = {
    hostName = "saph"; # Define your hostname.
    networkmanager.enable = true;
  };
  # Enable networking

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  #Desktop Env
  services = {
    xserver = {
      enable = true;
      layout = "gb";
      xkbVariant = "";
      displayManager = {
        gdm.enable = true;
	defaultSession = "none+bspwm";
      };
      xrandrHeads = [
        {
          output = "DP-3";
          monitorConfig = ''
          Option "PreferredMode" "2560x1440"
          Option "Rotate" "left"
          Option "LeftOf" "DP-2"
          '';
        }
        {
          output = "DP-2";
          primary = true;
          monitorConfig = ''
          Option "PreferredMode" "2560x1440"
          Option "Rate" "143.86"
          '';
        }
      ];
      desktopManager.gnome.enable = true;
      windowManager = {
        bspwm.enable = true;
      };
    };
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nebloc = {
    isNormalUser = true;
    description = "Ben";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Installed at route
  programs.zsh.enable = true;
  programs.steam.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    thunderbird
    neovim
    firefox
    git
    kitty
  ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
