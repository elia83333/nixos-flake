{ config, pkgs, inputs, ... }:
let
  flakeConfig = import ../fuckingFlakeStateVersion.nix;
  username = "elia";
in {
  imports = [
    # ./configs/folder/file
    ./configs/kitty/default.nix
    ./configs/fuzzel/default.nix
    ./configs/waybar/default.nix
    ./configs/swaylock/default.nix
    ./configs/fastfetch/default.nix
  ];

  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.stateVersion = flakeConfig.stateVersion;
  
  gtk.font.name = "IBM Plex Sans Var";

  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern";
  gtk.cursorTheme.size = 1;
  home.pointerCursor.package = pkgs.bibata-cursors;
  home.pointerCursor.name = "Bibata-Modern";
  home.pointerCursor.size = 1;
  home.pointerCursor.x11.enable = true;
  home.pointerCursor.x11.defaultCursor = "Simp1e-Nord-Dark";
}

