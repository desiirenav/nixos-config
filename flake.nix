{
  description = "nix config with flake, hm and impermanence";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
    nvim-config.url = "github:desiirenav/nvim-config";
    impermanence.url = "github:nix-community/impermanence";
    stylix.url = "github:danth/stylix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    disko.url = "github:nix-community/disko/latest";
    niri.url = "github:sodiboo/niri-flake";
    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, apple-fonts, disko, home-manager,  ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/config.nix
          inputs.disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.narayan = ./home/home.nix;
          }
        ];
      };
    };
  };
}
