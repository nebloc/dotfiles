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
    neofetch
    killall
    tree
    tldr
    freecad
    seahorse # Keychain
    wlsunset # Nightshift

    # social
    signal-desktop
    element-desktop
    discord

    # work
    libreoffice
    unstable.obsidian
    blanket

    # dev
    gcc
    git
    vscode
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
      ];
    })
    dbeaver-bin
    zeal
    kubectl
    dotnet-sdk_8
    jetbrains.idea-community
    #### Scala
    unstable.metals
    coursier
    sbt
    unstable.scala
    jdk21
    #### Rust
    rustc
    rustfmt
    cargo
    #### Python
    python3
    # Golang
    go
    #### nix
    nixfmt-rfc-style
    ### Lua
    lua

    # media
    unstable.cava
    cider
    calibre
    vlc
    cheese
  ];

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "nvim";
      DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
    };
    shellAliases = {
      k = "kubectl";
    };
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
