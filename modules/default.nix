{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./fish
    ./fonts
    ./gtk
    ./hjem
    ./matugen
    ./packages
    ./persist
  ];
}

