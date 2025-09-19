{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {

  home.username = "narayan";
  home.homeDirectory = "/home/narayan";

  programs.git = {
    enable = true;
    userName = "desiirenav";
    userEmail = "desiirenav@hotmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
