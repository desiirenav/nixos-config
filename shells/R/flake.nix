{
  description = "Quarto + Typst + R dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    rEnv = pkgs.rWrapper.override {
      packages = with pkgs.rPackages; [
        languageserver
        knitr
        rmarkdown
        readxl
        car
      ];
    };
  in {
    # example package (optional)
    packages.${system}.hello = pkgs.hello;
    packages.${system}.default = self.packages.${system}.hello;

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        quarto
        typst
        pandoc
        git
        curl
        rEnv
      ];

      shellHook = ''
        echo "Welcome to the Quarto + Typst development shell"
      '';
    };
  }
}