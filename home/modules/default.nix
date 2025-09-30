{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./fuzzel
    ./git
    ./ignis
    ./kitty
    ./niri
    ./nixcord
    ./nushell
    ./persist
    ./pkgs
    ./stylix
  ];
}

