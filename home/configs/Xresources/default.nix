# configs/Xresources/default.nix
{ config, pkgs, lib, ... }:

{
  home.file.".Xresources" = lib.mkForce {
    source = ./Xresources/.Xresources;
  };
}
