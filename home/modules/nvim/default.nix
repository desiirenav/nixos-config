{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = pkgs.vimPlugins; [
      nord-nvim
    ]
  };

  home.file.".config/nvim/settings.lua".source = ./init.lua;
}
