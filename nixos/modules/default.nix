{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./driver
    ./fonts 
    ./gaming
    ./hardware 
    ./ios 
    ./niri
    ./persist 
    ./pkgs
    ./R
    ./stylix
  ];
}

