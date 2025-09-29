# ╞═════════════════════════════╡ Super Cool Flake ╞═════════════════════════════╡
{
  description = "Elia83333's Flake";

# ╞═══════════════════════════════╡ Inputs ╞═════════════════════════════════╡
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager";
  };

# ╞═══════════════════════════════╡ Outputs ╞════════════════════════════════╡
  outputs = { self, nixpkgs, home-manager, ... }: let
    system = "x86_64-linux";
  in {

# ╞═════════════════╡ NixOS Host: iusenixbtw ╞═══════════════════════╡
    nixosConfigurations.iusenixbtw = nixpkgs.lib.nixosSystem {
      inherit system;

# ╞═══════════════════════════════╡ pkgs ══════════════════════════════════╡
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

# ╞═══════════════════════════════╡ Modules ══════════════════════════════════╡
      modules = [
        ./config.nix
        ./packages.nix
      ];
    };

# ╞═════════════════╡ Home Manager Configuration ╞═════════════════════════╡
    homeConfigurations.elia = home-manager.lib.homeManagerConfiguration {

# ╞═══════════════════════════════╡ pkgs for HM ══════════════════════════════╡
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = { allowUnfree = true; };
      };

# ╞═══════════════════════════════╡ Modules ══════════════════════════════════╡
      modules = [
        ./home/config.nix
        { home.stateVersion = "25.05"; }
      ];
    };
  };
}

