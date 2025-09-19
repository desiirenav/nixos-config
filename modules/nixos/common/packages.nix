{ inputs, config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    yazi
    ani-cli
    unzip
    nitch
    fastfetch
    fuzzel
    git
  ];

}

