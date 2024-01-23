{ inputs, lib, pkgs, config, outputs, ... }: {
  imports = [
      ./firefox.nix
      ./kitty.nix
      ./rofi.nix
      ./sxhkd.nix
      ./zsh.nix
      ./dunst.nix
  ];
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_:true);
      permittedInsecurePackages = [ "electron-25.9.0" ]; # For obsidian
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
  };


  programs.git = {
    enable = true;
    userName = "Ben Coleman";
    userEmail = "benjamin.coleman@me.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
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
