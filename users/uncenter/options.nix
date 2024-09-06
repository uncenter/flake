{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.palette = mkOption {
    type = types.attrs;
  };
}
