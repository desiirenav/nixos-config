{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./fish
    ./fuzzel
    ./git
    ./kitty
    ./niri
    ./pkgs
    ./stylix
  ];
}

