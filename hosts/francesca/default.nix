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
    firewall.allowedTCPPorts = [
      3000
    ];
  };
  
  #Desktop Env
  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      displayManager = {
        gdm.enable = true;
	defaultSession = "none+bspwm";
      };
      desktopManager.gnome.enable = true;
      windowManager = {
        bspwm.enable = true;
      };
    };
    tailscale.enable = true;
    k3s.enable = false;
    k3s.role = "server";

    fwupd.enable = true;
    fprintd = {
      enable = lib.mkDefault true;
      tod.enable = true;
      tod.driver = pkgs.libfprint-2-tod1-goodix;
    };
  };

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}