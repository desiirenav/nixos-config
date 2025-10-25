{ pkgs, inputs, config, ... }:

{  
  imports = [
    ./browser
    ./gaming
    ./niri
    ./nvim
  ];
  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swww
    gtk3
    gtk4
    kitty
    fuzzel
    (discord.override {
      withVencord = true;
    })
    capitaine-cursors
    adwaita-icon-theme
    matugen
    xwayland-satellite
    brightnessctl
    ani-cli
    adw-gtk3
    unzip
    pfetch
    fastfetch
    zathura
    git
  ];
}

