{ config, pkgs, ... }:

let
  # CHATGPT IF THIS DOESNT FUCKING WORK I WILL KILL YOU, EXTRACT UR ORGANS AND FEED EM TO UR FAMILY WHILE U WATCH. mightve been a bit too much prob gonna remove this commend late
  xresourcesFile = builtins.toString ./ ./.Xresources;
in
{
  home.file.".Xresources".source = xresourcesFile;
}