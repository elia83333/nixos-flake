{ config, pkgs, inputs, ... }:
let
  flakeConfig = import ../flake.nix;
  username = "elia";
in
{
  imports = [
    #./configs/folder/file
  ];
  
  programs.home-manager.enable = true;

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.stateVersion = flakeConfig.system.stateVersion;

}
