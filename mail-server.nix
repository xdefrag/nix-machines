{ config, pkgs, ... }:

with builtins;

let
  nixos-mailserver = (fetchTarball {
    url =
      "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/nixos-20.03/nixos-mailserver-nixos-20.03.tar.gz";
    sha256 = "02k25bh4pg31cx40ri4ynjw65ahy0mmj794hi5i1yn48j56vdbkj";
  });
in {
  imports = [ nixos-mailserver ];

  security.acme.email = "me@xdefrag.dev";
  security.acme.acceptTerms = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 587 993 ];
  };

  mailserver = {
    enable = true;
    fqdn = "mail.humanramen.dev";
    domains = [ "humanramen.dev" ];
    loginAccounts = {
      "s@humanramen.dev" = { hashedPasswordFile = "/home/xdefrag/s-passhash"; };
    };

    certificateScheme = 3;

    enableImap = true;
    enableImapSsl = true;

    enableManageSieve = true;

    virusScanning = false;
  };
}
