# configs/Xresources/default.nix
{ config, pkgs, ... }:

{
  home.file.".Xresources" = lib.mkForce {
    source = ./Xresources/.Xresources;
  };
}
