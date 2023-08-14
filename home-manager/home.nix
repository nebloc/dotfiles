{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nebloc";
  home.homeDirectory = "/home/nebloc";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # utilities
    firefox
    thunderbird
    zsh
    obsidian
    boxes
    libreoffice
    chromium
    nitrogen
    rofi

    # dev
    go
    git
    vscode

    # media
    cava
    steam
    cider
    calibre
    vlc

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nebloc/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  # Allow unfree packages (steam, obsidian, etc.)
  nixpkgs.config.allowUnfree = true;


  programs.git = {
    enable = true;
    userName = "Ben Coleman";
    userEmail = "benjamin.coleman@me.com";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set number relativenumber
      set mouse=a
      nnoremap <F3> :NERDTreeToggle<CR>
    '';
    plugins = with pkgs.vimPlugins; [
      nerdtree
      vim-go
      vim-nix
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    shellAliases = {
      ll = "ls -la";
      update = "home-manager switch";
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["sudo" "git"];
      theme = "robbyrussell";
    };
  };



  xsession.windowManager.bspwm = {
    enable = true;
    startupPrograms = [
      "$HOME/.config/polybar/launch.sh"
      "nitrogen --set-scaled $HOME/Pictures/wallpaper.jpg"
      "sxhkd"
      "polybar"
    ];
    monitors = {
      Virtual-1 = ["Main" "Mail" "Browse" "Code" "Games"];
      #DisplayPort-2 = ["Admin" "Messages" "Reference" "Music" "Gaming"];
    };
  };

  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + Return" = "kitty";
      "super + shift + Return" = "firefox";
      "super + @space" = "rofi -show drun";

      "super + Escape" = "pkill -USR1 -x sxhkd";

      "super + alt + {q,r}" = "bspc {quit,wm -r}";
      "super + q" = "bspc node -{c,k}";
      "super + m" = "bspc desktop -l next";
      "super + g" = "bspc node -s biggest.window";
      "super + {t,shift, + t,s,f}" = "bspc node -t {\~tiled,\~pseudo-tiled,\~floating,\~fullscreen}";
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
    };
  };
  
  services.polybar = {
    enable = true;
    script = ''
      polybar top &
    '';
    config = {
      "bar/top" = {
        monitor = "Virtual-1";
        width = "100%";
        height = "3%";
        radius = 0;
        modules-center = "date";
        wm-restack = "bspwm";
      };
      "module/date" = {
        type = "internal/date";
        internal = 5;
        date = "%d.%m.%y";
        time = "%H:%M";
        label = "%time%  %date%";
      };
    };
  };
}