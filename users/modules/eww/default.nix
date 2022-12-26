{ pkgs }:
{
  enable = true;
  package = pkgs.eww-wayland;
  configDir = .;
}
