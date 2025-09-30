{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {

  imports = [
    inputs.nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.nord.enable = true;
    plugins.lualine.enable = true;
  };
}
