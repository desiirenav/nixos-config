{ pkgs, inputs, config, ... }:

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
    fuzzel
    inputs.zen-browser.packages."${system}".default
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

