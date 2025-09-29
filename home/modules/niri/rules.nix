{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  programs.niri = {
    settings = {
      window-rules = [
        {
          geometry-corner-radius = {
            bottom-left = 3.0;
            bottom-right = 3.0;
            top-left = 3.0;
            top-right = 3.0;
          };
          clip-to-geometry = true;
        }
      ];
    };
  };
}
