{ lib, pkgs, ... }:
let
  homeDir = if pkgs.stdenv.isDarwin then "/Users/amodkala" else "/home/amod/";
  personalKeyPath = homeDir ++ ".ssh/id_ed25519_amodkala";
  workKeyPath = homeDir ++ ".ssh/id_rsa";

  vcs = lib.genAttrs [ "git" "jujutsu" ] (_: {
    enable = true;
    settings.user = {
      email = "amod.kala@vitalbio.com";
      name = "Amod Kala";
    };
  });
in
{

  programs = vcs // {
    ssh.matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = personalKeyPath;
        extraOptions.IdentitiesOnly = "yes";
      };
      "github.com-work" = {
        hostname = "github.com";
        user = "git";
        identityFile = workKeyPath;
        extraOptions.IdentitiesOnly = "yes";
      };
    };
  };
}
