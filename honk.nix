{ ... }:

{
  systemd.services.honk = {
    serviceConfig = {
      User = "honk";
      Group = "www";
      WorkingDirectory = "/opt/honk";
      ExecStart = "/opt/honk/honk run";
    };
    wantedBy = [ "default.target" ];
  };

  users.groups.www = {};

  users.users.honk = {
    isNormalUser = false;
    group = "www";
  };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts."xdefrag.dev" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = { proxyPass = "http://0.0.0.0:9000"; };
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };
}
