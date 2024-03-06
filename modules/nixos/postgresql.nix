{ pkgs, ... }:
{
  services = {
    postgresql = {
      enable = true;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };
    postgresqlBackup = {
      enable = true;
      startAt = "*-*-* 01:15:00";
    };
  };
}
