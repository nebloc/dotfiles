{pkgs, ...}: {

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

  # Saph has no swap partition. open-webui is unfree, so it is never in the
  # binary cache and its npm frontend build gets OOM-killed without swap.
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024; # MiB
    }
  ];

  networking = {
    hostName = "saph"; # Define your hostname.
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 8080 ];
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
    desktopManager.gnome.enable = true;
    displayManager = {
      gdm.enable = true;
      defaultSession = "hyprland";
    };
    xserver = {
      wacom.enable = true;
      enable = true;
      xkb.layout = "us";
    };
    ollama = {
      # `acceleration` is deprecated; pick the accelerated package instead.
      # RX 6800 XT -> ROCm.
      enable = true;
      package = pkgs.unstable.ollama-rocm;
    };
    open-webui = {
      enable = true;
      openFirewall = true;
      environment = {
        ANONYMIZED_TELEMETRY = "False";
        DO_NOT_TRACK = "True";
        SCARF_NO_ANALYTICS = "True";
        OLLAMA_API_BASE_URL = "http://127.0.0.1:11434/api";
        OLLAMA_BASE_URL = "http://127.0.0.1:11434";
      };
    };
  };

  programs.hyprland.enable = true;
  services.sshd.enable = true;

  # Configure console keymap
  console.keyMap = "uk";

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
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
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout"];
    packages = [
    ];
  };

  # Installed at route
  programs.fish.enable = true;
  programs.steam.enable = true;

  virtualisation.docker.enable = true;

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
