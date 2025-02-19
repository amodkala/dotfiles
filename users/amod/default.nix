{ config, pkgs, ... }:
{
  home = {
    stateVersion = "25.05";
    packages = with pkgs; [
      git
    ];
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "amod-vb";
      userEmail = "amod.kala@vitalbio.com";
    };
  };
}
