{ config, pkgs, inputs, ... }:
let
  flakeConfig = import ../fuckingFlakeStateVersion.nix;
  username = "elia";
in {
  imports = [
    # ./configs/folder/file.nix
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

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
    gtk3.extraConfig = {
      "gtk-cursor-theme-name" = "Bibata-Modern-Classic";
    };
    gtk4.extraConfig = {
      Settings = ''
      gtk-cursor-theme-name=Bibata-Modern-Classic
      '';
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
}

