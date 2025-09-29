{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./config
    ./disko.nix
    ./fonts.nix
    ./gaming.nix
    ./ios.nix
    ./neovim.nix
    ./niri.nix
    ./stylix.nix
  ];
}

