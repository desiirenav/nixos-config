{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.nvf.nixosModules.default
  ];
  
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        autocomplete.nvim-cmp.enable = true;
        statusline.lualine = lib.mkForce {
          enable = true;
          theme = "nord";
        };
        theme = lib.mkForce {
          enable = true;
          name = "nord";
          style = "dark";
        };
        languages = {
          nix.enable = true;
          r.enable = true;
        };
      };
    };
  };
}

