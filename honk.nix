{ ... }:

{
  systemd.services.honk = {
    serviceConfig = {
      WorkingDirectory= "/opt/honk";
      ExecStart = "/opt/honk/honk run";
    };
    wantedBy = [ "default.target" ];
  };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts."honk.humanramen.dev" = {
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
