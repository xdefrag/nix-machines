{ pkgs, ... }:

with builtins;

let
  vimrc = fetchurl
    "https://raw.githubusercontent.com/xdefrag/nix-config/master/dotfiles/vim/vimrc";
  vimc = pkgs.vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = readFile vimrc;
  };
  bashrc = fetchurl
    "https://raw.githubusercontent.com/mrzool/bash-sensible/master/sensible.bash";
in {
  environment.etc."bashrc.local".text = (readFile bashrc + ''
    alias v='vim'
  '');
  environment.systemPackages = with pkgs; [ git vimc ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };

  services.fail2ban.enable = true;

  nix.trustedUsers = [ "root" "xdefrag" ];

  users.users.xdefrag = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    uid = 1000;
    shell = pkgs.bash;
  };

  security.sudo.wheelNeedsPassword = false;

  security.acme.email = "me@xdefrag.dev";
  security.acme.acceptTerms = true;

  services.cron = {
    enable = true;
    systemCronJobs = [
      "0 * * * *  xdefrag ~/nix-machines/bin/update-nix-machines"
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}
