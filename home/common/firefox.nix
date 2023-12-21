{ pkgs, inputs, ... }:

let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
  {
    programs.firefox = {
      enable = true;
      profiles.nebloc = {
        extensions = with addons; [
          privacy-badger
          multi-account-containers
          bitwarden
        ];
        settings = {
          "browser.startup.homepage" = "duckduckgo.com";
        };
      };
    };
  }
