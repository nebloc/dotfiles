{ pkgs, outputs,  ... }: {
  imports = [
    ./hardware-configuration.nix
    outputs.nixosModules.nextcloud
    outputs.nixosModules.postgresql
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;

  networking = {
    hostName = "nixcloud";
    firewall = {
      interfaces."tailscale0" = {
        allowedTCPPorts = [ 22 ];
      };
      allowedTCPPorts = [
        80
        443
      ];
    };
  };

  users.users.root.openssh.authorizedKeys.keys = [''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCdZce1E0SXs7kL0AgvJgim9zZnLyuIJ6C11EH+7Suwf55G/+/hsPx/ghxIOflvrjHXH8iVWemgxauPdjqlJOFO58a+ypqC1yWWmMA9SMiRDkezeHEqG2B8wm4CByPNG+Uvg3o1oeiBf08J77Yw2XRMxaY+mWLahG/fBnf2x4k+yVpRtuBQPVX0CS8jkxyshcpdUWtSKwj96LqZWCmnieRHRJ6qk1uJzerlgnLAVxHUNNpnKlVUjuqk/0Ofqj7vyk1/zoFnjeK0HAnravqZ4JQDWMD0ynOgJwgXowNA3NfxV9VgUXCWd8Gn06XWtAC/QV7guNQkNRxxgUCf7QYGEtkGx1dyNaMfCQ3pw0BlMHlQOJ4i3Ytb9oF7cgWvQivqj1heqdwTGTCPosL/WZHiIi8RiRY0PjZR+yH/qhpqxtV4pTbk7KR/0FiH5R5p1Cn6SvMpO52nWMbYxDgQxNaCn1dfFVTtl/MzTyyLyewZ0etEdPWhQIEABqzsj8hA6+JMQ6U='' ];

  services = {
    openssh.enable = true;
    tailscale.enable = true;
    tailscale.useRoutingFeatures = "server";
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    restic
  ];

  systemd.timers."restic-backup" ={
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "3m";
      OnUnitActiveSec = "24h";
      Unit = "restic-backup.service";
    };
  };
  systemd.services."restic-backup" = {
    script = ''
      ${pkgs.restic}/bin/restic backup /var/backup/postgresql
      '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    environment = {
      RESTIC_REPOSITORY = "gs:nextbackup:/";
      RESTIC_PASSWORD_FILE = "/etc/restic/secret";
      GOOGLE_PROJECT_ID = "nebloccom";
      GOOGLE_APPLICATION_CREDENTIALS = "/etc/google/key.json";
    };
  };

  system.stateVersion = "23.11";
}
