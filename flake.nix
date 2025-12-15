{
  description = "nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    clrsync.url = "github:obsqrbtz/clrsync";
    #clrsync.url = "path:/home/dan/src/clrsync";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      clrsync,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
        ];
      };
    in
    {
      nixosConfigurations = {
        nixos-vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/vm/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };

        nixos-desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/desktop/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };

      homeConfigurations.dan = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home.nix
          clrsync.homeModules.default
        ];
      };
    };
}
