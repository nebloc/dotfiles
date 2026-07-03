{
  inputs,
  lib,
  pkgs,
  config,
  outputs,
  ...
}:
{
  imports = [
    ./firefox.nix
    ./kitty.nix
    ./rofi.nix
    ./sxhkd.nix
    ./shell.nix
    ./dunst.nix
    ./ghostty.nix
  ];
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [ "electron-39.8.10" ]; # For obsidian
    };
    overlays = [
      outputs.overlays.unstable-packages
      outputs.overlays.modifications
      outputs.overlays.additions
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    username = "nebloc";
    homeDirectory = "/home/nebloc";
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Ben Coleman";
      user.email = "benjamin.coleman@me.com";
      init.defaultBranch = "main";
      diff.tool = "nvimdiff";
      difftool.prompt = false;
    };
  };

  services = {
    flameshot.enable = true;
    redshift = {
      enable = true;
      latitude = 50.7183;
      longitude = -1.8743;
      temperature = {
        day = 6500;
        night = 2400;
      };
    };
  };
}
