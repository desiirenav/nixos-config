{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let 
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      environment = {
        DISPLAY = ":0";
        NIXOS_OZONE_WL = "1";
      };
      input = {
        keyboard.xkb.layout = "us";
        #touchpad, mouse, trackpoint = {} 
      };
      layout = {
        gaps = 0;
        preset-column-widths = [
          {proportion = 0.25;}
          {proportion = 0.5;}
          {proportion = 0.75;}
          {proportion = 1.0;}
        ];
        default-column-width = {proportion = 0.5;};
        focus-ring.enable = false;
        border = {
          enable = false;
          width = 1;
          #active.color = "#${base0D}";
          #inactive.color = "#${base07}";
        };
        shadow.enable = true;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
      };
      spawn-at-startup = [
        {command = ["xwayland-satellite"];}
        {command = ["swaybg" "-m" "fill" "-i" "${./../../../pics/beach.png}" ];}
      ];
      screenshot-path = "~/Pictures/Screenshots/%Y-%m-%dT%H:%M:%S.png";
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = false;
    };
  };
}
