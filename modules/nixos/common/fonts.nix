{pkgs, ...}: {
  fonts.packages = with pkgs; [
    lmodern
    corefonts
    sf-mono-liga-bin
  ];
}
