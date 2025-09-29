{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./disko.nix
    ./hardware.nix
    ./narayan.nix
    ./nvidia.nix
    ./persist.nix
    ./services.nix
  ];
}

