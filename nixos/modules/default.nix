{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./driver
    ./fonts 
    ./gaming
    ./hardware 
    ./ios 
    ./neovim 
    ./niri 
    ./persist 
    ./pkgs 
    ./stylix
  ];
}

