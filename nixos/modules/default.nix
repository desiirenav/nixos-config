{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./config
    ./disko.nix
    ./fonts.nix
    ./gaming.nix
    ./hardware.nix
    ./ios.nix
    ./neovim.nix
    ./niri.nix
    ./nvidia.nix
    ./persist.nix
    ./stylix.nix
  ];
}

