# Nix Machines
Nixos scripts for my machines.

## comfort-zone.nix
Vim + Git with configs. Switch to it and you're ready to do big things.

I use Digital Ocean for running my services and DO has no nix support... BUT FEAR NOT!
With easy script like [ this ]( https://raw.githubusercontent.com/Hoverbear-Consulting/nixos-digitalocean/master/default.nix ) you can easily create
minimum Nixos images with bash and ssh, upload it to Custom Image and use.  

For more info look to [ this repo ]( https://github.com/Hoverbear-Consulting/nixos-digitalocean ).

## mail-server.nix
Why not use your own mail server? No advertisements, no telemetries, just good
old encrypted text information going around.

Look at
[ nixos-mailserver ]( https://gitlab.com/simple-nixos-mailserver/nixos-mailserver )
repository for scripts, and detailed
[ guide ]( https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/blob/master/docs/setup-guide.rst ). When you finish to tune things around be sure to check your spam score at [ Mail Tester ]( https://www.mail-tester.com/ ).

