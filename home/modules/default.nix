{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./fuzzel.nix
    ./git.nix
    ./ignis.nix
    ./kitty.nix
    ./niri.nix
    ./nixcord.nix
    ./packages.nix
    ./persist.nix
  ];
}

