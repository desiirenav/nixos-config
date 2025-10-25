{
  description = "nix config with flake, hm and impermanence";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    disko.url = "github:nix-community/disko/latest";
    hjem.url = "github:feel-co/hjem";
    impermanence.url = "github:nix-community/impermanence";
    mnw.url = "github:Gerg-L/mnw";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = inputs@{ self, nixpkgs, disko, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./core/default.nix ];
      };
    };
  };
}
