{ pkgs, inputs, ... }:

let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
  {
    programs.firefox = {
      enable = true;
      profiles.nebloc = {
        extensions = with addons; [
          # lastpass-password-manager
          privacy-badger
          multi-account-containers
        ];
        settings = {
          "browser.startup.homepage" = "duckduckgo.com";
        };
      };
    };
  }
