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
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      nvim-cmp
      Nvim-R
      {
        plugin = nord-nvim;
        config = "colorscheme nord";
      }
      {
        plugin = lualine-nvim;
        config = "lua require('lualine').setup()";
      }
    ];
  };

  home.file.".config/nvim/settings.lua".source = ./init.lua;
}
