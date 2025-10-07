{ config, pkgs, spicetify-nix, ... }:

{
  programs.spicetify = {
    enable = true;
    enabledExtensions = [ spicetify-nix.extensions.marketplace ];
  };
}

