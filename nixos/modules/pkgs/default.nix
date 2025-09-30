{ inputs, config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    yazi
    vlc
    ani-cli
    unzip
    nitch
    fastfetch
    fuzzel
    git
  ];

}

