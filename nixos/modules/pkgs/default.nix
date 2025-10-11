{ inputs,  pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    yazi
    ani-cli
    unzip
    nitch
    pfetch
    fastfetch
    zathura
    git
  ];

}

