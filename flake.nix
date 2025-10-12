{
  description = "nix config with flake, hm and impermanence";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
    copyparty.url = "github:9001/copyparty";
    nixcord.url = "github:kaylorben/nixcord";
    nvim-config.url = "github:desiirenav/nvim-config";
    impermanence.url = "github:nix-community/impermanence";
    stylix.url = "github:danth/stylix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    disko.url = "github:nix-community/disko/latest";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    ignis.url = "github:ignis-sh/ignis";
    niri.url = "github:sodiboo/niri-flake";
    textfox.url = "github:adriankarlen/textfox";
    zen-browser.url = "github:pfaj/zen-browser-flake";
    base2Tone-nvim.url = "github:atelierbram/Base2Tone-nvim";
    base2Tone-nvim.flake = false;
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
