{ config, pkgs, inputs, ... }:
let
  flakeConfig = import ../fuckingFlakeStateVersion.nix;
  username = "elia";
in {
  imports = [
    # ./configs/folder/file
  ];

  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.stateVersion = flakeConfig.stateVersion;
  
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
    font = {
      name = "Dejavu Sans Mono";
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern";
    size = 16;
  };
}

