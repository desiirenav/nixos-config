{ inputs, config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    yazi
    vlc
    ani-cli
    unzip
    nitch
    fastfetch
    vim
    fuzzel
    git
  ];

}

