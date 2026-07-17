{ pkgs, inputs, config, ... }:

let
  addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in
  {
    programs.firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
      profiles.nebloc = {
        
        extensions.packages = with addons; [
          privacy-badger
          multi-account-containers
          bitwarden
        ];
        settings = {
          "browser.startup.homepage" = "duckduckgo.com";
          "full-screen-api.ignore-widgets" = true;
        };
      };
    };
  }
