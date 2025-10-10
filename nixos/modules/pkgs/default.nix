{ inputs,  pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    sops
    age
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

