{ lib, pkgs, ... }:
let
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
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      includes = lib.optional pkgs.stdenv.hostPlatform.isDarwin "~/.orbstack/ssh/config";
      settings = {
        "github.com" = {
          HostName = "github.com";
          User = "git";
          IdentityFile = "~/.ssh/id_ed25519_amodkala";
          IdentitiesOnly = true;
        };
      };
    };
  };
}
