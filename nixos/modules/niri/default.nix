{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  programs.niri = {
    enable = true;
  };
}
