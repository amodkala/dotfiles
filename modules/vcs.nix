{ lib, ... }:
{
  programs = lib.genAttrs [ "git" "jujutsu" ] (_: {
    enable = true;
    settings.user = {
      email = "amodkala@gmail.com";
      name = "Amod Kala";
    };
  });
}
