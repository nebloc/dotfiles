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
    tree
    tldr
    freecad

    # social
    signal-desktop
    element-desktop
    discord

    # work
    libreoffice
    obsidian
    blanket

    # dev
    go
    git
    vscode
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    azuredatastudio
    kubectl

    # media
    cava
    cider
    calibre
    vlc
  ];

  home.shellAliases = {
    k = "kubectl";
  };

  #   -----------
  #  |   eDP-1   |
  #  |           |
  #   -----------
  #
  # TODO: Add monitor config
}
