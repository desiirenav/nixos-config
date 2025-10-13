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
    image = ./../../../pics/nord.png;
    polarity = "dark";
    base16Scheme = {
      base00 = "242933"; 
      base01 = "2E3440";
      base02 = "3B4252";
      base03 = "4C566A";
      base04 = "D8DEE9";
      base05 = "E5E9F0";
      base06 = "ECEFF4";
      base07 = "8FBCBB";
      base08 = "BF616A";
      base09 = "D08770";
      base0A = "EBCB8B";
      base0B = "A3BE8C";
      base0C = "88C0D0";
      base0D = "81A1C1";
      base0E = "B48EAD";
      base0F = "5E81AC";
    };
    cursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Nord)";
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

