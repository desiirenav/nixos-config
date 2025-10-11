{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./firefox
    ./fish
    ./fuzzel
    ./git
    #./ignis
    ./kitty
    ./niri
    ./nixcord
    ./persist
    ./pkgs
    ./stylix
  ];
}

