{...}:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = /*sh*/ ''
      set EDITOR nvim
      set fish_greeting
      if not set -q ZELLIJ
          if test "$ZELLIJ_AUTO_ATTACH" = "true"
              zellij attach -c
          else
              zellij
          end

          if test "$ZELLIJ_AUTO_EXIT" = "true"
              kill $fish_pid
          end
      end
    '';
  };
  programs.zellij = {
    enable = true;
    settings = {
      default_layout = "compact";
      # default_mode = "locked";
      theme = "kanagawa";
      show_startup_tips = false;
    };
  };
}
