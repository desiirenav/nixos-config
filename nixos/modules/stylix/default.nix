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
    image = ./../../../pics/beach.png;
    base16Scheme = {
      base00 = "201d2a";
      base01 = "2c2839";
      base02 = "4b455f";
      base03 = "625a7c";
      base04 = "6e658b";
      base05 = "a286fd";
      base06 = "c9b9fe";
      base07 = "efebff";
      base08 = "7451e6";
      base09 = "c16bff";
      base0A = "d294ff";
      base0B = "7c6f85";
      base0C = "ecd1ff";
      base0D = "dba8ff";
      base0E = "9375f5";
      base0F = "8363ee";
    };
    polarity = "dark";
    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 22;
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

