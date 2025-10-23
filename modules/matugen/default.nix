{pkgs, lib, config, ...}:let
  wallpaper = "/etc/nixos/pics/cave.png";
  createMatugen = pkgs.writeShellScriptBin "createMatugen" ''
    ${pkgs.matugen}/bin/matugen image ${wallpaper}
  '';
in {

  environment.systemPackages = with pkgs; [ createMatugen ];
  systemd.user.services = {
    "swwwDaemon" = {
      description = "A Solution to your Wayland Wallpaper Woes";
      partOf = ["graphical-session.target"];
      after = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.swww}/bin/swww-daemon";
        Restart = "on-failure";
        RestartSec = 3;
      };
    };
    "matugenDaemon" = {
      description = "Applying themes with matugen";
      partOf = [ "graphical-session.target" "swwwDaemon.service" ];
      wants  = [ "swwwDaemon.service" ];
      after  = [ "graphical-session.target" "swwwDaemon.service" ];
      wantedBy = [ "graphical-session.target" ];
      path = [ pkgs.swww pkgs.matugen pkgs.coreutils ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = lib.getExe createMatugen;
        Restart = "on-failure";
        RestartSec = 3;
      };
    };
  };


  hjem.users.narayan.files = {
    ".config/matugen/config.toml".source = pkgs.writers.writeTOML "config.toml" {
      config = {
        wallpaper = {
          command = "swww";
          arguments = ["img" "--transition-type" "center"];
          set = true;
        };
      };
      templates = {
        gtk3 = {
          input_path = ./templates/gtk-colors.css;
          output_path = "~/.config/gtk-3.0/colors.css";
        };
        gtk4 = {
          input_path = ./templates/gtk-colors.css;
          output_path = "~/.config/gtk-4.0/colors.css";
        };
        fuzzel = {
          input_path = ./templates/fuzzel.ini;
          output_path = "~/.config/fuzzel/fuzzel.ini";
        };
        midnight-discord = {
          input_path = ./templates/midnight-discord.css;
          output_path = "~/.config/vesktop/themes/midnight-discord.css";
        };
        starship = {
          input_path = ./templates/starship.toml;
          output_path = "~/.config/starship.toml";
        };
        kitty = {
          input_path = ./templates/kitty-colors.conf;
          output_path = "~/.config/kitty/kitty.conf";
        };
        fish = {
          input_path = ./templates/colors-fish.theme;
          output_path = "~/.config/fish/themes/Matugen.theme";
        };
        yazi = {
          input_path = ./templates/theme.toml;
          output_path = "~/.config/yazi/theme.toml";
        };
        walker = {
          input_path = ./templates/walker.css;
          output_path = "~/.config/walker/themes/matugen.css";
        };
        zathura = {
          input_path = ./templates/zathura;
          output_path = "~/.config/zathura/zathurarc";
        };
      };
    };
  };
}
