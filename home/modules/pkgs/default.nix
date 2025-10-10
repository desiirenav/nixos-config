{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = with pkgs;[
    xwayland-satellite
    brightnessctl
    swaybg
    adwaita-icon-theme
  ];
}
