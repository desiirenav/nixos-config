{ pkgs, ... }:

{  
  imports = [
    ./browser
    ./gaming
    ./nvim
  ];
  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    swww
    gtk3
    gtk4
    kitty
    vesktop
    bibata-cursors
    adwaita-icon-theme
    matugen
    xwayland-satellite
    brightnessctl
    fuzzel
    ani-cli
    adw-gtk3
    unzip
    pfetch
    fastfetch
    zathura
    git
  ];
}

