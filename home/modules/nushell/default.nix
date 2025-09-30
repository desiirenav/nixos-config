{ config, pkgs, inputs, ... }:

{
  programs.nushell = {
    enable = true;
    extraConfig = ''
    '';
  };
}
