{pkgs, inputs, ...}: 
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
    thunderbird
    neovim
    firefox
    git
    kitty
    bitwarden
    protonmail-bridge
    protonvpn-gui
    protonvpn-cli
    xtitle
    usbutils 

    libnotify

    rebuild-home
    rebuild-system
  ];
  programs.starship.enable = true;
}
