{pkgs, inputs, lib, ...}: {

    imports = [
       ./hardware-configuration.nix
       ../common.nix
    ];   
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "francesca"; # Define your hostname.
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [
        3000
      ];
    };
  };
  
  #Desktop Env
  services = {
    xserver = {
      enable = true;
      xkb = {
        variant = "";
        layout = "us";
      };
      xrandrHeads = [
        {
          output = "eDP-1";
          monitorConfig = ''
          Option "PreferredMode" "2256x1504"
          '';
        }
      ];
      displayManager = {
        gdm.enable = true;
      };
      desktopManager.gnome.enable = true;
      # windowManager = {
      #   bspwm.enable = true;
      # };
      wacom.enable = true;
    };
    displayManager = {
        defaultSession = "hyprland";
    };
    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
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
      enable = lib.mkDefault true;
      tod.enable = true;
      tod.driver = pkgs.libfprint-2-tod1-goodix;
    };

    gnome.gnome-keyring.enable = true;
  };

  programs.hyprland.enable = true;

  services.sshd.enable = true;

  # Configure console keymap
  console.keyMap = "us";

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
    extraGroups = [ "networkmanager" "wheel" "docker" "video" ];
    packages = with pkgs; [
    ];
  };

  virtualisation.docker.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.nm-applet.enable = true;


  # Control brightness in bspwm 
  programs.light.enable = true;

  # security = {
  #   polkit.enable = true;
  #   pam.services.nebloc.enableGnomeKeyring = true;
  # };
  #
  # systemd = {
  #   user.services.polkit-gnome-authentication-agent-1 = {
  #     description = "polkit-gnome-authentication-agent-1";
  #     wantedBy = [ "graphical-session.target" ];
  #     wants = [ "graphical-session.target" ];
  #     after = [ "graphical-session.target" ];
  #     serviceConfig = {
  #       Type = "simple";
  #       ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #       Restart = "on-failure";
  #       RestartSec = 1;
  #       TimeoutStopSec = 10;
  #     };
  #   };
  # };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
