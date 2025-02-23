{ config, pkgs, ... }:
{

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "amod-vb";
      userEmail = "amod.kala@vitalbio.com";
    };

    neovim.package = pkgs.neovim;
  };

  home.stateVersion = "25.05";
}
