{ config, pkgs, ... }:

{
  home.file.".Xresources".source = ./Xresources/.Xresources;
}