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
      home = config.home.homeDirectory;
      shell = pkgs.fish;
    };

    home = {
      username = "uncenter";
      homeDirectory =
        if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
    };
  };
}
