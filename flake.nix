# ╞═════════════════════════════╡ Super Cool Flake ╞═════════════════════════════╡

{
  description = "Elia83333's Flake";

# ╞═══════════════════════════════╡ Inputs ╞═════════════════════════════════╡

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {

# ╞═════════════════╡ Hostname Declaration (iusenixbtw) ╞═══════════════════════╡
    
    nixosConfigurations.iusenixbtw = nixpkgs.lib.nixosSystem {

# ╞═══════════════════════════════╡ Variables ╞═════════════════════════════════╡

    system = "x86_64-linux";
    # var = "var";
    config.allowUnfree = true;
# ╞═══════════════════════════════╡ Modules ╞═════════════════════════════════╡
      
      modules = [
        ./config.nix
        ./packages.nix

        home-manager.nixosModules.home-manager
        { nixpkgs.config.allowUnfree = true; }
      ];
    };
  };
}
