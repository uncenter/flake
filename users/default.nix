{
  inputs,
  config,
  pkgs,
  ...
}:
{
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
      };

      users.uncenter = import ./uncenter;
    };

    users.users.uncenter = {
      home = if pkgs.stdenv.isDarwin then "/Users/uncenter" else "/home/uncenter";
      shell = pkgs.fish;
    };
  };
}
