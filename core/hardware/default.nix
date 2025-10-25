{ inputs, config, lib, pkgs, ... }:

{
  imports = [
     inputs.disko.nixosModules.disko
    ./disko.nix
    ./hardware.nix
    ./nvidia.nix
  ];
}

