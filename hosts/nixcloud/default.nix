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
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];
  
  system.stateVersion = "23.11";
}
