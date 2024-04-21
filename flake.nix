{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
    catppuccin-toolbox.url = "github:catppuccin/toolbox";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin-custom-icons.url = "github:ryanccn/nix-darwin-custom-icons";

    izrss = {
      url = "github:isabelroses/izrss";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    darwin-custom-icons,
    ...
  } @ inputs: let
    systems = ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
    pkgsForEach = nixpkgs.legacyPackages;
  in {
    darwinConfigurations.Katara = nix-darwin.lib.darwinSystem {
      modules = [
        home-manager.darwinModules.home-manager
        darwin-custom-icons.darwinModules.default
        ./system.nix
      ];

      specialArgs = {
        inherit self inputs;
      };
    };

    homeManagerModules = {
      silicon = ./modules/extra/home-manager/silicon.nix;

      default = builtins.throw "No default module is provided by this flake";
    };

    formatter = forAllSystems (system: pkgsForEach.${system}.alejandra);

    devShells = forAllSystems (system: {
      default = pkgsForEach.${system}.mkShellNoCC {
        packages = with pkgsForEach.${system}; [
          statix
          deadnix
          alejandra
        ];
      };
    });
  };
}
