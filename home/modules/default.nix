{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./fuzzel
    ./git
    ./ignis
    ./kitty
    ./niri
    ./nvim
    ./nixcord
    ./persist
    ./pkgs
    ./stylix
  ];
}

