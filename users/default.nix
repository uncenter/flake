{
  inputs,
  config,
  pkgs,
  ...
}: {
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
      };

      users.uncenter = import ./uncenter;
    };

    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${config.home.username}"
      else "/home/${config.home.username}";

    users.users.uncenter = {
      home = config.homeDirectory;
      shell = pkgs.fish;
    };
  };
}
