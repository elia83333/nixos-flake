{
  description = "Elia83333's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
  };

  outputs = { self, nixpkgs, home-manager, ... }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.iusenixbtw = nixpkgs.lib.nixosSystem {
      inherit system;
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      modules = [
        ./config.nix
        ./packages.nix
      ];
    };

    homeConfigurations.elia = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      modules = [
        ./home/default.nix
      ];
    };
  };
}

