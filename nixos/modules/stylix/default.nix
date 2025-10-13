{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    autoEnable = true;
    enable = true;
    image = ./../../../pics/gruvbox.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";
    cursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
      size = 24;
    };
    fonts = {
      serif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };
      sansSerif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };
      monospace = {
        package = pkgs.sf-mono-liga-bin;
        name = "Liga SFMono Nerd Font";
      };
      sizes.terminal = 12;
    };
  };
}

