{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    librewolf
    yazi
    vlc
    ani-cli
    unzip
    nitch
    fastfetch
    fuzzel
    zathura
    git
  ];

}

