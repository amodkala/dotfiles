{ pkgs, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
  };
  # Required for nix-darwin to work
  system.stateVersion = 6;
  system.primaryUser = "amodkala";

  users.users.amodkala = {
    name = "amodkala";
    home = "/Users/amodkala";
  };

  nix = {
    package = pkgs.nixVersions.latest;
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 3;
        Minute = 0;
      };
      options = "--delete-older-than 14d";
    };
    optimise.automatic = true;
  };

  environment.systemPackages = [ pkgs.orbstack ];

  programs.zsh.enable = true;
}
