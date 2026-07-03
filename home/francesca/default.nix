{
  pkgs,
  ...
}:

{

  imports = [
    ../common
    ./hyprland.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    asciiquarium
    zsh
    chromium
    pavucontrol
    killall
    tree
    tldr
    freecad
    seahorse # Keychain
    wlsunset # Nightshift

    # org
    todoist-electron
    todoist

    # social
    signal-desktop
    element-desktop
    discord

    # work
    libreoffice
    unstable.obsidian
    blanket

    # dev
    direnv
    gcc
    git
    vscode
    dbeaver-bin
    zeal
    kubectl
    dotnet-sdk_8
    #### Scala
    unstable.metals
    coursier
    sbt
    unstable.scala
    jdk21
    #### Elixir
    elixir
    #### Rust
    rustc
    rustfmt
    cargo
    #### Python
    python3
    # Golang
    go
    #### nix
    nixfmt
    ### Lua
    lua
    ### Zig
    zig
    zls

    # media
    unstable.cava
    # TODO: find out if cider has a replacement?
    # cider
    cider-2
    calibre
    vlc
    cheese

    nfi
  ];

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  programs.thunderbird = {
    enable = true;
    settings = {
      "mailnews.default_news_sort_order" = 2;
      "mailnews.default_sort_order" = 2;
      "mailnews.default_sort_type" = 22;
    };
    profiles."main" = {
      isDefault = true;
      settings = {
        "mailnews.default_news_sort_order" = 2;
        "mailnews.default_sort_order" = 2;
        "mailnews.default_sort_type" = 22;
      };
    };
  };
  #   -----------
  #  |   eDP-1   |
  #  |           |
  #   -----------
  #
  # TODO: Add monitor config
  home.stateVersion = "23.05"; # Please read the comment before changing.
}
