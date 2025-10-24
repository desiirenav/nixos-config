{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in
  {
    devShells."x86_64-linux".default = pkgs.mkShell {
      packages = with pkgs;[
        quarto
        R
        texliveFull
        typst
        rPackages.rmarkdown
        rPackages.languageserver
        rPackages.knitr
        rPackages.rmarkdown
        rPackages.readxl
        rPackages.car
      ];
      shellHook = ''
        echo Welcome to the quarto-typst developpment shell
      '';    
    };
  };
}
`
