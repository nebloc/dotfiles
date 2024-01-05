{pkgs, inputs, ...}: {

  imports = [
    ./hardware-configuration.nix
    ../common.nix
  ];   

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
      wacom.enable = true;
      enable = true;
      layout = "us";
      xkbVariant = "";
      displayManager = {
        gdm.enable = true;
	      defaultSession = "none+bspwm";
      };
      xrandrHeads = [
        {
          output = "DP-2";
          monitorConfig = ''
          Option "PreferredMode" "2560x1440"
          Option "Rotate" "left"
          Option "LeftOf" "DP-1"
          '';
        }
        {
          output = "DP-1";
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

  services.sshd.enable = true;

  # Configure console keymap
  console.keyMap = "uk";

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
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    ];
  };

  # Installed at route
  programs.zsh.enable = true;
  programs.steam.enable = true;

  virtualisation.docker.enable = true;

  programs.nm-applet.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
