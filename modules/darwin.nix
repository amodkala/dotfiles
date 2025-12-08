{
  config,
  pkgs,
  lib,
  ...
}:
{
  # Required for nix-darwin to work
  system.stateVersion = 1;

  users.users.amod = {
    name = "amod";
    home = "/Users/amod";
  };
}
