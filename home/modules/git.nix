{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {

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
