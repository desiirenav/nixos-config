{ inputs, config, lib, pkgs, ... }:

{
  imports = [
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

