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
    nix-darwin,
    home-manager,
    darwin-custom-icons,
    ...
  } @ inputs: {
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
  };
}
