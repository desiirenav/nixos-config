{ inputs,  pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    yazi
    ghostty
    ani-cli
    unzip
    nitch
    pfetch
    fastfetch
    zathura
    git
  ];

}

