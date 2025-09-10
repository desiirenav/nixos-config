{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./../../modules/home-manager/impermanence.nix
    ./../../modules/home-manager/ignis.nix
    ./../../modules/home-manager/anyrun.nix
    ./../../modules/home-manager/niri.nix
    ./../../modules/home-manager/nixcord.nix
    ./../../modules/home-manager/kitty.nix
  ];

  home.username = "narayan";
  home.homeDirectory = "/home/narayan";

  home.stateVersion = "25.11";

  home.packages = with pkgs;[
  ];

  #programs.fish = {
  #  enable = true;
  #  interactiveShellInit = ''
  #    set fish_greeting
  #
  #    if [ (tty) = "/dev/tty1" ]
  #       exec niri-session
  #    end
  #
  #    if test (tty) = "/dev/tty1"
  #       exec niri-session
  #    end
  # '';
  #};

  programs.git = {
    enable = true;
    userName = "desiirenav";
    userEmail = "desiirenav@hotmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  nixpkgs.config.allowUnfree = true;

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
