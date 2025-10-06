{ config, pkgs, lib, ... }:

{
  home.file.".Xresources" = lib.mkForce {
    text = builtins.readFile ./Xresources/.Xresources;
    target = ".Xresources";
  };
}
