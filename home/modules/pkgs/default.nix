{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = with pkgs;[
    inputs.zen-browser.packages."${pkgs.system}".default
    (import ./vim.nix)
    xwayland-satellite
    brightnessctl
    nautilus
    swaybg
    adwaita-icon-theme
  ];
}
