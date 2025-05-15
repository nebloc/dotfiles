{
  description = "NIX to meet you";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-flake.url = "github:nebloc/nixvim";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, disko, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      
      systems = [ "x86_64-linux" "aarch64-linux" ];
      
      forEachSystem = f: lib.genAttrs systems (sys: f pkgsFor.${sys});
      pkgsFor = nixpkgs.legacyPackages;
    in
    {
      inherit lib;
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = {
        saph = lib.nixosSystem { # Desktop
          modules = [ ./hosts/saph ];
          specialArgs = { inherit inputs outputs; };
        };
        francesca = lib.nixosSystem { # Laptop 
          modules = [ ./hosts/francesca disko.nixosModules.disko ];
          specialArgs = { inherit inputs outputs; };
        };   
        nixcloud = lib.nixosSystem { # Hetzner server 
          modules = [ ./hosts/nixcloud ];
          specialArgs = { inherit inputs outputs; };
        };   
      };

      homeConfigurations = {
        "nebloc@saph" = home-manager.lib.homeManagerConfiguration { # Desktop
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/saph
          ];
        };
        "nebloc@francesca" = home-manager.lib.homeManagerConfiguration { # Laptop
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/francesca
          ];
        };
      };
    };
 }
