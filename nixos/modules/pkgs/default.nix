{ inputs,  pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    yazi
    nautilus
    librewolf
    ani-cli
    unzip
    pfetch
    fastfetch
    zathura
    git
  ];
}

