{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./../../modules/home-manager/users/narayan.nix 
    ./../../modules/home-manager/common/fuzzel.nix 
    ./../../modules/home-manager/common/helix.nix 
    ./../../modules/home-manager/common/ignis.nix
    ./../../modules/home-manager/common/impermanence.nix
    ./../../modules/home-manager/common/kitty.nix
    ./../../modules/home-manager/common/niri.nix
    ./../../modules/home-manager/common/nixcord.nix
    ./../../modules/home-manager/common/packages.nix
  ];

  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
