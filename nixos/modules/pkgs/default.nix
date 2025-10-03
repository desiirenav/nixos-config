{ inputs,  pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    yazi
    vlc
    ani-cli
    unzip
    nitch
    neofetch
    pfetch
    fastfetch
    fuzzel
    zathura
    git
  ];

}

