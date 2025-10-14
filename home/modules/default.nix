{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./fish
    ./fuzzel
    ./git
    ./kitty
    ./niri
    ./persist
    ./pkgs
    ./stylix
  ];
}

