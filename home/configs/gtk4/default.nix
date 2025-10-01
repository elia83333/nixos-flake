{ config, pkgs, ... }:

{
  home.file.".config/gtk-4.0/settings.ini".source = ./settings.ini;
}
