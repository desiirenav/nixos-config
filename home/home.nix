{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./modules/default.nix
  ];


  home.username = "narayan";
  home.homeDirectory = "/home/narayan";

  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
