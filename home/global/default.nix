{ inputs, lib, pkgs, config, outputs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_:true);
    };
  };

  home = {
    username = "nebloc";
    homeDirectory = "/home/nebloc";
    sessionVariables = {
      EDITOR = "nvim";
    };
    sessionPath = [
      "$HOME/dotfiles/bin"
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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
}
