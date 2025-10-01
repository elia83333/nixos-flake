{ config, pkgs, inputs, ... }:
let
  flakeConfig = import ../fuckingFlakeStateVersion.nix;
  username = "elia";
in {
  imports = [
    # ./configs/folder/file
    ./configs/gtk3/default.nix
    ./configs/gtk4/default.nix
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
      name = "IBM Plex Sans Var";
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern";
    size = 16;
  };
  xdg.icons.enable = true;
}

