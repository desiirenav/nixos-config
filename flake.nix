{
  description = "nix config with flake, hm and impermanence";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "github:notashelf/nvf";
    nixcord.url = "github:kaylorben/nixcord";
    impermanence.url = "github:nix-community/impermanence";
    stylix.url = "github:danth/stylix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    disko.url = "github:nix-community/disko/latest";
    ignis.url = "github:ignis-sh/ignis";
    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };
    zen-browser.url = "github:pfaj/zen-browser-flake";
  };

  outputs = inputs@{ self, nixpkgs, apple-fonts, disko, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/config.nix
          inputs.disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            #home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.narayan = ./home/home.nix;
          }
        ];
      };
    };
  };
}
