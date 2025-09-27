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
    XDG_ICON_THEME = "Papirus";
    # var = "var";

# ╞═══════════════════════════════╡ Modules ╞═════════════════════════════════╡
      
      modules = [
        ./config.nix
        ./packages.nix
      ];
    };
  };
}
