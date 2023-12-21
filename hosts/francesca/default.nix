{pkgs, inputs, ...}: {

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
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    ];
  };

  # Installed at route
  programs.zsh.enable = true;
  programs.steam.enable = true;

  virtualisation.docker.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.nm-applet.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
