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
    pkgs = import nixpkgs { inherit system; };
  in {

# ╞═════════════════╡ NixOS Host: iusenixbtw ╞═══════════════════════╡
    nixosConfigurations.iusenixbtw = nixpkgs.lib.nixosSystem {
      inherit system pkgs;

# ╞═══════════════════════════════╡ Modules ╞═════════════════════════════════╡
      modules = [
        ./config.nix
        ./packages.nix
      ];
    };

# ╞═════════════════╡ Home Manager Configuration ╞═════════════════════════╡
    homeConfigurations.elia = home-manager.lib.homeManagerConfiguration {
      inherit system pkgs;
      modules = [ ./home/config.nix ];

# ╞═══════════════════════════════╡ Variables ╞═════════════════════════════╡
      home.stateVersion = "25.05";
      allowUnfree = true;
    };
  };
}

