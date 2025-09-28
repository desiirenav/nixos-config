{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./system/defaut.nix
    ./gaming.nix
    ./ios.nix
    ./neovim.nix
    ./niri.nix
    ./pkgs.nix
    ./stylix.nix
  ];
}

