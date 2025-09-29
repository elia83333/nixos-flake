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
   
    system.stateVersion = "25.05";
    system = "x86_64-linux";
    system.stateVersion = "25.05";
# ╞═══════════════════════════════╡ Modules ╞═════════════════════════════════╡
      
      modules = [
        ./config.nix
        ./packages.nix

      ];
    };
  };
}
