{ config, pkgs, inputs, ... }:

let
  username = "elia";
in {
  imports = [
    # ./configs/folder/file
  ];

  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = "/home/" + username;
}

