{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nord-nvim;
        config = "colorscheme nord";
      }
    ];
  };
}
