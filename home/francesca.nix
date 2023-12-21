{ config, pkgs, ... }:

{

  imports =
    [ 
      ./global
      ./common
      ./francesca/polybar.nix
    ];


  home.stateVersion = "23.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    asciiquarium
    thunderbird
    zsh
    boxes
    chromium
    nitrogen
    rofi
    pavucontrol
    neofetch 
    killall
    picom
    tree
    tldr
    freecad

    # work
    libreoffice
    obsidian

    # dev
    go
    git
    vscode
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    azuredatastudio

    # media
    cava
    discord
    cider
    calibre
    vlc
  ];

  #   -----------
  #  |   eDP-1   |
  #  |           |
  #   -----------
  #
  # TODO: Add monitor config
}
