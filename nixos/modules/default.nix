{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./config
    ./fonts.nix
    ./gaming.nix
    ./ios.nix
    ./neovim.nix
    ./niri.nix
    ./stylix.nix
  ];
}

