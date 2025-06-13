{
  lib,
  pkgs,
  ...
}:
{

  imports = [
    ./hardware-configuration.nix
    ./disks.nix
    ../common.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = lib.mkForce [ "btrfs" ];

  # Connectivity.
  networking = {
    hostName = "francesca"; # Define your hostname.
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [
        3000
      ];
    };
  };
  services.blueman.enable = true; # Gui for bluetooth

  #Desktop Env
  services = {
    xserver = {
      xkb = {
        variant = "";
        layout = "us";
      };
      displayManager = {
        gdm.enable = true;
      };
      desktopManager.gnome.enable = true;
      wacom.enable = true;
    };
    displayManager = {
      defaultSession = "hyprland";
    };
    libinput = {
      enable = true;
      touchpad.naturalScrolling = false;
    };
    tailscale = {
      enable = false;
      useRoutingFeatures = "client";
    };
    k3s = {
      enable = false;
      role = "server";
    };

    fwupd.enable = true;
    fprintd = {
      enable = true;
    };

    gnome.gnome-keyring.enable = true;
  };

  programs.hyprland.enable = true;

  services.sshd.enable = true;

  # Configure console keymap
  console.keyMap = "us";

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
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "video"
      "dialout"
    ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  virtualisation.docker.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Needed for proton vpn
  programs.nm-applet.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Make electron work w/ Wayland

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
