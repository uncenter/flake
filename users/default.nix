{
  pkgs,
  self,
  self',
  inputs,
  inputs',
  ...
}:
{
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit
          self
          self'
          inputs
          inputs'
          ;
      };

      sharedModules = [
        { home.stateVersion = "23.05"; }
      ];

      users.uncenter = ./uncenter;
    };

    users.users.uncenter = {
      home = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/uncenter" else "/home/uncenter";
      shell = pkgs.fish;
    };
  };
}
