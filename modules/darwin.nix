{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlays.default
  ];
  # Required for nix-darwin to work
  system.stateVersion = 1;

  users.users.amod = {
    name = "amod";
    home = "/Users/amod";
  };
}
