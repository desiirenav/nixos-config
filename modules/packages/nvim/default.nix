{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.mnw.nixosModules.default ];

  programs.mnw = {
    enable = true;
    aliases = [
      "vi"
      "vim"
    ];
    luaFiles = [
      ./init.lua
    ];
    plugins = {
      start =  with pkgs.vimPlugins; [
      ];
    };
  };
} 
