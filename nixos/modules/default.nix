{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./driver
    ./fonts 
    ./gaming
    ./hardware 
    ./ios 
    ./niri
    ./nvim
    ./persist 
    ./pkgs 
    ./stylix
  ];
}

