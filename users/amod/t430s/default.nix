{ config, pkgs, ... }:
{
  home = {
    username = "amod";
    homeDirectory = "/home/amod";
    stateVersion = "22.11";
  };

  xdg = {
    configFile.nvim = {
      source = ../../modules/neovim;
      recursive = true;
    };
  };

  programs = with pkgs; {

    neovim = import ../../modules/neovim { inherit pkgs; };

    git = {
      enable = true;
      userName = "amodkala";
      userEmail = "amodkala@gmail.com";
    };
  };
}
