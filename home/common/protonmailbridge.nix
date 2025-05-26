{ pkgs, ... }:
{
  systemd.user.services.protonmailbridge = {
    enable = true;
    description = "ProtonMail Bridge for proton.me email with thunderbird";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge";
    };
    wantedBy = [ "multi-user.target" ];
  };
}