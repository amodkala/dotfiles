{ config, pkgs, ... }:
{
  home = {
    stateVersion = "24.11";
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

  imports = [
    ../../modules/catppuccin
    ../../modules/ghostty
    ../../modules/neovim
    ../../modules/tmux
  ];

}
