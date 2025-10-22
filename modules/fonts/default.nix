{ config, lib,pkgs,inputs,system,...}: 

{ 
  nixpkgs.overlays = [
    (final: prev: {
      sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
      pname = "sf-mono-liga-bin";
      version = "dev";
      src = inputs.sf-mono-liga-src;
      dontConfigure = true;
      installPhase = ''
        mkdir -p $out/share/fonts/opentype
        cp -R $src/*.otf $out/share/fonts/opentype/
      '';
     };
   }) 
  ];

  fonts = {
    packages = with pkgs; [
      inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd
      sf-mono-liga-bin
      nerd-fonts.caskaydia-cove
      corefonts
      lmodern
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "SFProDisplay Nerd Font" ];
        sansSerif = [ "SFProDisplay Nerd Font"];
        monospace = [ "CaskaydiaCove Nerd Font Mono" ];
      };
    };
  };
}
