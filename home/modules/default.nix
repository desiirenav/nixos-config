{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./fuzzel
    ./git
    ./ignis
    ./kitty
    ./niri
    ./nixcord
    ./nvim
    ./nushell
    ./persist
    ./pkgs
    ./stylix
  ];
}

