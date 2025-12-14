{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    clrsync.url = "github:obsqrbtz/clrsync";
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
      pkgs = nixpkgs.legacyPackages.${system};

      commonModules = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.dan = import ./home.nix;
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        nixos-vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = commonModules ++ [
            ./hosts/vm/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };

        nixos-desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = commonModules ++ [
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
        ];
      };
    };
}
