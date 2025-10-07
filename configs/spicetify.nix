{ config, pkgs, ... , spicetify-nix ? null }:

{
  programs.spicetify = {
    enable = true;
    enabledExtensions = [ spicetify-nix.extensions.marketplace ];
  };
}


