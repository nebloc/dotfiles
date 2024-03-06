{ self, config, lib, pkgs, ... }: {
  # Based on https://carjorvaz.com/posts/the-holy-grail-nextcloud-setup-made-easy-by-nixos/
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "benjamin.coleman@me.com";
      dnsProvider = "cloudflare";
      # location of your CLOUDFLARE_DNS_API_TOKEN=[value]
      # https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html#EnvironmentFile=
      environmentFile = "/etc/cloudflare/secret.env";
    };
  };
  services = {
    nginx.virtualHosts = {
      "next.nebloc.com" = {
        forceSSL = true;
        enableACME = true;
        # Use DNS Challenege.
        acmeRoot = null;
      };
    };
    # 
    nextcloud = {
      enable = true;
      hostName = "next.nebloc.com";
      # Need to manually increment with every major upgrade.
      package = pkgs.nextcloud28;
      # Let NixOS install and configure the database automatically.
      database.createLocally = true;
      # Let NixOS install and configure Redis caching automatically.
      configureRedis = true;
      # Increase the maximum file upload size.
      maxUploadSize = "16G";
      https = true;
      autoUpdateApps.enable = true;
      extraAppsEnable = true;
      extraApps = with config.services.nextcloud.package.packages.apps; {
        # List of apps we want to install and are already packaged in
        # https://github.com/NixOS/nixpkgs/blob/master/pkgs/servers/nextcloud/packages/nextcloud-apps.json
        inherit calendar contacts notes onlyoffice tasks cookbook qownnotesapi deck mail;
        };
      config = {
        overwriteProtocol = "https";
        defaultPhoneRegion = "EN";
        dbtype = "pgsql";
        adminuser = "admin";
        adminpassFile = "/etc/nextcloud/secret";
      };
      # Suggested by Nextcloud's health check.
      phpOptions."opcache.interned_strings_buffer" = "16";
    };
  };
}
