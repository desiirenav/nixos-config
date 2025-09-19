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
    nautilus
    swaybg
    adwaita-icon-theme
  ];

}
