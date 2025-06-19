{...}:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = /*sh*/ ''
      set EDITOR nvim
      set fish_greeting
      # set ZELLIJ_AUTO_ATTACH true
      # set ZELLIJ_AUTO_EXIT true
      # if not set -q ZELLIJ
      #   if test "$ZELLIJ_AUTO_ATTACH" = "true"
      #     zellij attach -c main
      #   else
      #     zellij --session main --layout compact
      #   end
      #
      #   if test "$ZELLIJ_AUTO_EXIT" = "true"
      #     kill $fish_pid
      #   end
      # end
    '';
  };
  # programs.zellij = {
  #   enable = true;
  #   settings = {
  #     default_layout = "compact";
  #     theme = "kanagawa";
  #     show_startup_tips = false;
  #   };
  # };
}
