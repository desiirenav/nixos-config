{ inputs, config, lib, pkgs, ... }:

{
  imports = [
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

