{pkgs, inputs, outputs, ...}: 
let
  rebuild-system = pkgs.writeScriptBin "rebuild-system" (builtins.readFile ../bin/refreshos);
  rebuild-home = pkgs.writeScriptBin "rebuild-home" (builtins.readFile ../bin/refreshhome);
in
{

  nix = {
    settings = {
    	auto-optimise-store = true;
	    allowed-users = [ "nebloc" ];
    };
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

    # Allow unfree packages
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      outputs.overlays.unstable-packages
    ];
  };


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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Starter
    thunderbird
    neovim
    firefox
    git
    kitty
    bitwarden
    protonmail-bridge
    unstable.protonvpn-gui
    protonvpn-cli
    xtitle
    usbutils 
    ripgrep

    libnotify

    rebuild-home
    rebuild-system
  ];
  programs.starship.enable = true;
}
