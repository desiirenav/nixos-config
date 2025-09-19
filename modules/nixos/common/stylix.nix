{
  config,
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
    image = ./../../../assets/wallpapers/nord.svg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    polarity = "dark";
    cursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Nord)";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.sf-mono-liga-bin;
        name = "Liga SFMono Nerd Font";
      };
    };
  };
}

