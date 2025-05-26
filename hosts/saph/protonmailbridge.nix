{ pkgs, ... }:
{
  systemd.user.services.protonmail-bridge = {
    enable = true;
    description = "ProtonMail Bridge for proton.me email with thunderbird";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --no-window --noninteractive";
    };
    wantedBy = [ "multi-user.target" ];
  };
}