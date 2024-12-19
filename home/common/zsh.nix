{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
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
}
