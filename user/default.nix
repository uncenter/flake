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

      users.uncenter = ./home.nix;
    };

    users.users.uncenter = {
      home = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/uncenter" else "/home/uncenter";
      openssh.authorizedKeys.keys = [ (builtins.readFile ../keys/ssh.pub) ];
      shell = pkgs.fish;
    };
  };
}
