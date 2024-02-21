{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraLuaConfig = builtins.replaceStrings ["$METALS_PATH"] ["${pkgs.metals}"] (builtins.readFile ../etc/init.lua);
  };
} 
