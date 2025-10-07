{
  description = "Elia83333's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { self, nixpkgs, home-manager, spicetify-nix, ... }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.iusenixbtw = nixpkgs.lib.nixosSystem {
      inherit system;

      # Define pkgs first
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowBroken = true;
        };
      };

      # Modules
      modules = [
        ./packages.nix
        ./config.nix
        spicetify-nix.nixosModules.default
      ];

      # Pass spicetify-nix as an argument to your config
      configurationArgs = {
        spicetify-nix = spicetify-nix;
      };
    };

    homeConfigurations.elia = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      modules = [
        ./home/default.nix
        spicetify-nix.homeManagerModules.default
      ];
    };
  };
}

